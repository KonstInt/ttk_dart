import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:pos_payment_terminal/src/data/helpers/encoders_decoders/tlv_decoder.dart';
import 'package:pos_payment_terminal/src/data/helpers/encoders_decoders/tlv_encoder.dart';
import 'package:pos_payment_terminal/src/data/helpers/tag_analizer.dart';
import 'package:pos_payment_terminal/src/data/mapper/pos_api/pos_api_mapper.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_payment_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_refund_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_service_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_abort_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_payment_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_refund_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_service_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/base_models/api_pos_service_tag_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_service_tags/pos_service_tags_enum.dart';
import 'package:pos_payment_terminal/src/logger/logger.dart';

class POSService {
  POSService({required this.ip, required this.port});
  late Socket posSocket;
  late StreamSubscription<Uint8List> _posApiStreamSubscription;
  bool _posStreamInitialized = false;
  final String ip;
  final int port;

  ///Function which try to connect with posTerminal, and return
  ///bool flag - success (true) or failure (false)
  Future<bool> posSocketConnect() async {
    if (!_posStreamInitialized) {
      try {
        //Connect to the posTerminal with protocol timeout - 15 seconds
        posSocket =
            await Socket.connect(ip, port).timeout(const Duration(seconds: 15));
        //Start listening messages from the posTerminal
        _posApiStreamSubscription = posSocket.listen((event) {});
        _posStreamInitialized = true;
        //If successful return true
        return true;
      } on Exception {
        //If have error return false
        return false;
      }
    } else {
      return true;
    }
  }

  Future<bool> posSocketDisconnect() async {
    if (_posStreamInitialized) {
      try {
        await _posApiStreamSubscription.cancel();
        posSocket.destroy();
        _posStreamInitialized = false;
        return true;
      } on Exception {
        return false;
      }
    } else {
      return true;
    }
  }

  bool createAbort(ApiAbortModel abort) {
    try {
      _checkIfConnected();
      posSocket.add(BerTlvEncoderEncoder.encoderClient(
            POSApiResultMapper.abortModelToAPI(abort),
          ) ??
          []);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<ApiResultPaymentModel> createPayment(ApiPaymentModel payment) async {
    _checkIfConnected();
    final Completer<ApiResultPaymentModel> c =
        Completer<ApiResultPaymentModel>();
    var tagMap = POSApiResultMapper.paymentModelToAPI(payment);
    var binaryRequest = BerTlvEncoderEncoder.encoderClient(tagMap);
    posSocket.add(binaryRequest ?? []);
    _posApiStreamSubscription.onData((data) {
      try {
        var tmpData = data;
        var dataLength = data.length;
        final List<Map<POSServiceTagsEnum, ApiPOSServiceTagModel>> tags = [];
        while (dataLength != 0) {
          final (tmpTagData, tmpTagLength) =
              BerTlvEncoderDecoder.decoderService(tmpData);
          if (tmpTagData != null) tags.add(tmpTagData);
          dataLength -= tmpTagLength + 2;
          if (dataLength >= 0) {
            tmpData = tmpData.sublist(tmpTagLength + 2);
          }

          logger.debugPrint(tmpTagData);
        }

        for (final decodedData in tags) {
          if (TagListAnalyzer.isBelongToOperation(
            tags: decodedData,
            ern: payment.idempotenceKeyERN,
            type: payment.operationType,
            clientID: payment.clientId,
          )) {
            if (TagListAnalyzer.hasOperationResultCode(decodedData)) {
              final response =
                  POSApiResultMapper.resultPaymentModelFromAPI(decodedData);

              c.complete(response);
              _posApiStreamSubscription.cancel();
            }
          }
        }
      } on Exception {
        logger.debugPrint('Exception on service level payment');
      }
    });
    return c.future;
  }

  Future<ApiResultRefundModel> createRefund(ApiRefundModel refund) async {
    _checkIfConnected();
    final Completer<ApiResultRefundModel> c = Completer<ApiResultRefundModel>();
    posSocket.add(BerTlvEncoderEncoder.encoderClient(
            POSApiResultMapper.refundModelToAPI(refund)) ??
        []);
    _posApiStreamSubscription.onData((data) {
      try {
        var tmpData = data;
        var dataLength = data.length;
        final List<Map<POSServiceTagsEnum, ApiPOSServiceTagModel>> tags = [];
        while (dataLength != 0) {
          final (tmpTagData, tmpTagLength) =
              BerTlvEncoderDecoder.decoderService(tmpData);
          if (tmpTagData != null) tags.add(tmpTagData);
          dataLength -= tmpTagLength + 2;
          if (dataLength >= 0) {
            tmpData = tmpData.sublist(tmpTagLength + 2);
          }

          logger.debugPrint(tmpTagData);
        }

        for (final decodedData in tags) {
          if (TagListAnalyzer.isBelongToOperation(
            tags: decodedData,
            ern: refund.idempotenceKeyERN,
            type: refund.operationType,
            clientID: refund.clientId,
          )) {
            if (TagListAnalyzer.hasOperationResultCode(decodedData)) {
              final response =
                  POSApiResultMapper.resultRefundModelFromAPI(decodedData);

              c.complete(response);
              _posApiStreamSubscription.cancel();
            }
          }
        }
      } on Exception {
        logger.debugPrint('Exception on service level payment');
      }
    });
    return c.future;
  }

  Future<ApiResultServiceModel> createServiceOperation(
      ApiServiceModel service) async {
    _checkIfConnected();
    final Completer<ApiResultServiceModel> c =
        Completer<ApiResultServiceModel>();
    posSocket.add(BerTlvEncoderEncoder.encoderClient(
            POSApiResultMapper.serviceModelToAPI(service)) ??
        []);
    _posApiStreamSubscription.onData((data) {
      try {
        var tmpData = data;
        var dataLength = data.length;
        final List<Map<POSServiceTagsEnum, ApiPOSServiceTagModel>> tags = [];
        while (dataLength != 0) {
          final (tmpTagData, tmpTagLength) =
              BerTlvEncoderDecoder.decoderService(tmpData);
          if (tmpTagData != null) tags.add(tmpTagData);
          dataLength -= tmpTagLength + 2;
          if (dataLength >= 0) {
            tmpData = tmpData.sublist(tmpTagLength + 2);
          }

          logger.debugPrint(tmpTagData);
        }

        for (final decodedData in tags) {
          if (TagListAnalyzer.isBelongToOperation(
            tags: decodedData,
            ern: service.idempotenceKeyERN,
            type: service.operationType,
            clientID: service.clientId,
          )) {
            if (TagListAnalyzer.hasOperationResultCode(decodedData)) {
              final response =
                  POSApiResultMapper.resultServiceModelFromAPI(decodedData);

              c.complete(response);
              _posApiStreamSubscription.cancel();
            }
          }
        }
      } on Exception {
        logger.debugPrint('Exception on service level payment');
      }
    });
    return c.future;
  }

  void _checkIfConnected() {
    if (!_posStreamInitialized) {
      throw Exception('Connection is not initialized');
    }
  }
}
