import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:ttk_payment_terminal/logger/logger.dart';
import 'package:ttk_payment_terminal/src/data/helpers/encoders_decoders/tlv_decoder.dart';
import 'package:ttk_payment_terminal/src/data/helpers/encoders_decoders/tlv_encoder.dart';
import 'package:ttk_payment_terminal/src/data/helpers/tag_analizer.dart';
import 'package:ttk_payment_terminal/src/data/mapper/ttk_api/ttk_api_mapper.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_refund_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_service_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_service_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';

class TTKService {
  TTKService({required this.ip, required this.port});
  late final Socket ttkSocket;
  late final StreamSubscription<Uint8List> _ttkApiStreamSubscription;
  bool _ttkStreamInitialized = false;
  final String ip;
  final int port;

  ///Function which try to connect with ttkTerminal, and return
  ///bool flag - success (true) or failure (false)
  Future<bool> ttkSocketConnect() async {
    if (!_ttkStreamInitialized) {
      try {
        //Connect to the ttkTerminal with protocol timeout - 15 seconds
        ttkSocket =
            await Socket.connect(ip, port).timeout(const Duration(seconds: 15));
        //Start listening messages from the ttkTerminal
        _ttkApiStreamSubscription = ttkSocket.listen((event) {});
        _ttkStreamInitialized = true;
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

  Future<bool> ttkSocketDisconnect() async {
    if (!_ttkStreamInitialized) {
      try {
        await _ttkApiStreamSubscription.cancel();
        ttkSocket.destroy();
        _ttkStreamInitialized = false;
        return true;
      } on Exception {
        return false;
      }
    } else {
      return true;
    }
  }

  Future<ApiResultPaymentModel> createPayment(ApiPaymentModel payment) async {
    final Completer<ApiResultPaymentModel> c =
        Completer<ApiResultPaymentModel>();
    ttkSocket.add(BerTlvEncoderEncoder.encoderClient(
            TTKApiResultMapper.paymentModelToAPI(payment)) ??
        []);
    _ttkApiStreamSubscription.onData((data) {
      try {
        var tmpData = data;
        var dataLength = data.length;
        final List<Map<TTKServiceTagsEnum, ApiTTKServiceTagModel>> tags = [];
        while (dataLength != 0) {
          final (tmpTagData, tmpTagLength) =
              BerTlvEncoderDecoder.decoderService(tmpData);
          if (tmpTagData != null) tags.add(tmpTagData);
          dataLength -= tmpTagLength + 2;
          if (dataLength >= 0) {
            tmpData = tmpData.sublist(tmpTagLength + 2);
          }

          logger.log(Level.debug, tmpTagData);
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
                  TTKApiResultMapper.resultPaymentModelFromAPI(decodedData);

              c.complete(response);
              _ttkApiStreamSubscription.cancel();
            }
          }
        }
      } on Exception {
        logger.e('Exception on service level payment');
      }
    });
    return c.future;
  }

  Future<(bool, String?)> createRefund(ApiRefundModel refund) async {
    final Completer<(bool, String?)> c = Completer<(bool, String?)>();
    ttkSocket.add(BerTlvEncoderEncoder.encoderClient(
            TTKApiResultMapper.refundModelToAPI(refund)) ??
        []);
    _ttkApiStreamSubscription.onData((data) {
      try {
        var tmpData = data;
        var dataLength = data.length;
        final List<Map<TTKServiceTagsEnum, ApiTTKServiceTagModel>> tags = [];
        while (dataLength != 0) {
          final (tmpTagData, tmpTagLength) =
              BerTlvEncoderDecoder.decoderService(tmpData);
          if (tmpTagData != null) tags.add(tmpTagData);
          dataLength -= tmpTagLength + 2;
          if (dataLength >= 0) {
            tmpData = tmpData.sublist(tmpTagLength + 2);
          }

          logger.log(Level.debug, tmpTagData);
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
                  TTKApiResultMapper.resultRefundModelFromAPI(decodedData);

              c.complete((response.success, response.receipt));
              _ttkApiStreamSubscription.cancel();
            }
          }
        }
      } on Exception {
        logger.e('Exception on service level payment');
      }
    });
    return c.future;
  }

  Future<(bool, String?)> createServiceOperation(
      ApiServiceModel service) async {
    final Completer<(bool, String?)> c = Completer<(bool, String?)>();
    ttkSocket.add(BerTlvEncoderEncoder.encoderClient(
            TTKApiResultMapper.serviceModelToAPI(service)) ??
        []);
    _ttkApiStreamSubscription.onData((data) {
      try {
        var tmpData = data;
        var dataLength = data.length;
        final List<Map<TTKServiceTagsEnum, ApiTTKServiceTagModel>> tags = [];
        while (dataLength != 0) {
          final (tmpTagData, tmpTagLength) =
              BerTlvEncoderDecoder.decoderService(tmpData);
          if (tmpTagData != null) tags.add(tmpTagData);
          dataLength -= tmpTagLength + 2;
          if (dataLength >= 0) {
            tmpData = tmpData.sublist(tmpTagLength + 2);
          }

          logger.log(Level.debug, tmpTagData);
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
                  TTKApiResultMapper.resultServiceModelFromAPI(decodedData);

              c.complete((response.success, response.receipt));
              _ttkApiStreamSubscription.cancel();
            }
          }
        }
      } on Exception {
        logger.e('Exception on service level payment');
      }
    });
    return c.future;
  }

  void _errorHandler(error, StackTrace trace) {
    // print(error);
  }

  void _doneHandler() {
    ttkSocket.destroy();
  }
}
