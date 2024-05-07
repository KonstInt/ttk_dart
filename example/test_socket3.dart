import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operation_service_type.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_refund_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_service_model.dart';
import 'package:ttk_payment_terminal/src/data/service/ttk_service.dart';

Future<void> test() async {
  const int a = 0;
  const int b = 1;
  final service = TTKService(ip: '10.0.0.104', port: 8888);
  await service.ttkSocketConnect();
  final res = await service.createPayment(
    ApiPaymentModel(
      amount: 1.5,
      clientId: '2456',
      idempotenceKeyERN: '123456789E',
    ),
  );

  final receip = await service.createServiceOperation(
    ApiServiceModel(
     serviceType:ApiTTKOperationServiceType.CHECK_SUM,
      clientId: '2456',
      idempotenceKeyERN: '123456789E',
    ),
  );

  final ress = await service.createRefund(
    ApiRefundModel(
        amount: 1.5,
        clientId: '2456',
        idempotenceKeyERN: '123456789E',
        retrievalReferenceNumber: res.retrievalReferenceNumber??'55'),
  );
  const int i = 0;
  await service.ttkSocketDisconnect();
  return;
}

void main() async {
  test();
}
