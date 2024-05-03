import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/service/ttk_service.dart';

Future<void> test() async {
  const int a = 0;
  const int b = 1;
  final service = TTKService(ip: '10.0.0.104', port: 8888);
  await service.ttkSocketConnect();
  final res = await service.createPayment(ApiPaymentModel(
      amount: 100.0, clientId: '245', idempotenceKeyERN: '12345678E'));
  const int i = 0;
}

void main() async {
  test();
}
