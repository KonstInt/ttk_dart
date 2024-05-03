import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/helpers/encoders_decoders/tlv_decoder.dart';
import 'package:ttk_payment_terminal/src/data/helpers/encoders_decoders/tlv_encoder.dart';
import 'package:ttk_payment_terminal/src/data/helpers/tag_analizer.dart';
import 'package:ttk_payment_terminal/src/data/mapper/ttk_api/ttk_api_mapper.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_payment_model.dart';
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

  Future<bool> createPayment(ApiPaymentModel payment) async {
    final Completer<bool> c = Completer<bool>();
    final ssdf =  TTKApiResultMapper.paymentModelToAPI(payment);
    final Uint8List? cssat= BerTlvEncoderEncoder.encoderClient(
       ssdf     );
    ttkSocket.add(cssat??[]);
    _ttkApiStreamSubscription.onData((data) {
      try{
      final (decodedData, _) = BerTlvEncoderDecoder.decoderService(data);
      if (TagListAnalyzer.isBelongToOperation(
          tags: decodedData ?? {},
          ern: payment.idempotenceKeyERN,
          type: payment.operationType,
          clientID: payment.clientId,
          // terminalID:
          //     ''
          )) {
        if (TagListAnalyzer.hasOperationResultCode(decodedData ?? {})) {

          final response =
              TTKApiResultMapper.resultPaymentModelFromAPI(decodedData ?? {});
          c.complete(response.success);
        }
      }
      }
      catch(e){
        int i = 0;
      }
      //c.complete(decodedData);
    });
    return await c.future;
  }

  void _errorHandler(error, StackTrace trace) {
    // print(error);
  }

  void _doneHandler() {
    ttkSocket.destroy();
  }
}
