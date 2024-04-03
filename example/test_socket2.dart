import 'dart:convert';
import 'dart:io';

import 'package:ttk_payment_terminal/src/data/logger/logger.dart';

void main() {
  // Создаем новый POS терминал клиента
  final POSClient posClient = POSClient('10.0.0.104', 8888);
  // Отправляем запрос о продаже (Это пример, замените на вашу специфическую структуру сообщения)
  posClient.sendTransaction({
    'type': 'SALE',
    'amount': 1000,
  });
}

class POSClient {

  POSClient(this._host, this._port);
  final String _host;
  final int _port;

  void sendTransaction(Map<String, dynamic> transactionData) {
    Socket.connect(_host, _port).then((socket) {
      logger.i(
          'Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
      // Кодировка сообщения в JSON и отправка
      socket.write(jsonEncode(transactionData));
      socket.flush();
      // Получение ответа от терминала
      socket.listen(
        (data) {
          final response = jsonDecode(utf8.decode(data));
         logger.i('Response from terminal: $response');
          // Обработка ответа...
          socket.destroy();
        },
        onError: (error) {
          logger.e('Error: $error');
          socket.destroy();
        },
        onDone: () {
          logger.i('Transaction completed.');
          socket.destroy();
        },
      );
    }).catchError((error) {
      logger.e('An error occurred: $error');
    });
  }
}
