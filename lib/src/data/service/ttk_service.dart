import 'dart:io';
import 'dart:typed_data';

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
