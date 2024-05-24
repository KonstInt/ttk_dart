import 'dart:developer';

var logger = Logger();

class Logger {
  Logger();
  void debugPrint(Object? message) {
    log('___________DEBUG MESSAGE_____________');
    log(message?.toString() ?? 'NULL');
    log('_____________________________________');
  }
}
