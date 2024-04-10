import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/helpers/tlv_decoder.dart';
import 'package:ttk_payment_terminal/src/data/models/models/base_models/ttk_client_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/models/base_models/ttk_service_tag_model.dart';

class TTKService {
  TTKService({required this.ip, required this.port});
  late final Socket ttkSocket;
  final String ip;
  final int port;

  ///Function which try to connect with ttkTerminal, and return
  ///bool flag - success (true) or failure (false)
  Future<bool> ttkSocketConnect() async {
    try {
      //Connect to the ttkTerminal with protocol timeout - 15 seconds
      ttkSocket =
          await Socket.connect(ip, port).timeout(const Duration(seconds: 15));
      //Start listening messages from the ttkTerminal
      ttkSocket.listen(_dataHandler,
          onError: _errorHandler, onDone: _doneHandler, cancelOnError: false);
      //If successful return true
      return true;
    } catch (e) {
      //If have error return false
      return false;
    }
  }

  Future<List<TTKServiceTagModel>> createPayment(
      List<TTKClientTagModel> tagList) {
    final Completer<List<TTKServiceTagModel>> c =
        Completer<List<TTKServiceTagModel>>();
    ttkSocket.listen((Uint8List data) {
      final resList = BerTlvEncoderDecoder.decoderService(data);
      
    },
    onError: _errorHandler, 
    onDone: _doneHandler, cancelOnError: false);

    return c.future;
  }

  void _dataHandler(Uint8List data) {
    final ddd = data;
    final s = data.toString();
    // print(s);
  }

  void _errorHandler(error, StackTrace trace) {
    // print(error);
  }

  void _doneHandler() {
    ttkSocket.destroy();
  }
}
