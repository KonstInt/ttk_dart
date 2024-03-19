import 'dart:io';
import 'dart:convert';

void main() {
  // Создаем новый POS терминал клиента
  POSClient posClient = POSClient('10.0.0.104', 8888);
  // Отправляем запрос о продаже (Это пример, замените на вашу специфическую структуру сообщения)
  posClient.sendTransaction({
    'type': 'SALE',
    'amount': 1000,
  });
}

class POSClient {
  final String _host;
  final int _port;

  POSClient(this._host, this._port);

  void sendTransaction(Map<String, dynamic> transactionData) {
    Socket.connect(_host, _port).then((Socket socket) {
      print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
      // Кодировка сообщения в JSON и отправка
      socket.write(jsonEncode(transactionData));
      socket.flush();
      // Получение ответа от терминала
      socket.listen(
        (List<int> data) {
          final response = jsonDecode(utf8.decode(data));
          print('Response from terminal: $response');
          // Обработка ответа...
          socket.destroy();
        },
        onError: (error) {
          print('Error: $error');
          socket.destroy();
        },
        onDone: () {
          print('Transaction completed.');
          socket.destroy();
        },
      );
    }).catchError((error) {
      print('An error occurred: $error');
    });
  }
}