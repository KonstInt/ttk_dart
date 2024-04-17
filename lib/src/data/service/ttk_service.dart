import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/helpers/tlv_decoder.dart';
import 'package:ttk_payment_terminal/src/data/helpers/tlv_encoder.dart';
import 'package:ttk_payment_terminal/src/data/models/models/base_models/ttk_client_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/models/base_models/ttk_service_tag_model.dart';

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

  Future<List<TTKServiceTagModel>> createPayment(
      List<TTKClientTagModel> tagList) async {
    final Completer<List<TTKServiceTagModel>> c =
        Completer<List<TTKServiceTagModel>>();
    ttkSocket.add(BerTlvEncoderEncoder.encoderClient(tagList) ?? []);
    _ttkApiStreamSubscription.onData((data) {
      final (decodedData, _) = BerTlvEncoderDecoder.decoderService(data);
      c.complete(decodedData);
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
