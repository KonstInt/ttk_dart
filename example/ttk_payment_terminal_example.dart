import 'package:pos_payment_terminal/pos_payment_terminal.dart';

void main() async {
  final posModule = POSPaymentModule(ip: '10.0.0.104', port: 8888);
  await posModule.connect();
  await posModule.createService(
      clientId: '01',
      operationServiceType: OperationServiceType.CHECK_SUM,
      idempotenceKeyERN: '01234567');

  final paymentCreation = await posModule.createPayment(
      amount: 1.5, clientId: '123456', idempotenceKeyERN: '228');
  final refundCreation = await posModule.createRefund(
      amount: 10,
      clientId: '123456',
      idempotenceKeyERN: '228',
      retrievalReferenceNumber: paymentCreation.retrievalReferenceNumber!);
  if (refundCreation.success || refundCreation.receipt != null) {
    //Some actions here
  }
}
