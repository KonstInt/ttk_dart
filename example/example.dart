import 'package:pos_payment_terminal/pos_payment_terminal.dart';

void main() async {
  final posModule = POSPaymentModule(
    ip: '10.0.0.104',
    port: 8888,
  );

  await posModule.connect();

  final smena = await posModule.createService(
    organizationCode: null,
    clientId: '01',
    operationServiceType: OperationServiceType.CHECK_SUM,
    idempotenceKeyERN: '01234567',
  );
  final paymentCreation = await posModule.createPayment(
    organizationCode: null,
    amount: 1.5,
    clientId: 'PC001',
    idempotenceKeyERN: '228',
  );

  final test = await posModule.createService(
    organizationCode: 1,
    clientId: '01',
    operationServiceType: OperationServiceType.CALL_APP_MENU,
    idempotenceKeyERN: '01234567',
  );

  final refundCreation = await posModule.createRefund(
    organizationCode: 3,
    amount: 5,
    clientId: '123456',
    idempotenceKeyERN: '228',
    retrievalReferenceNumber: paymentCreation.retrievalReferenceNumber!,
  );
  await posModule.disconnect();
}
