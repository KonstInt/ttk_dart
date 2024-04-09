import 'package:ttk_payment_terminal/src/domain/models/payment_model.dart';

abstract class TTKPaymentRepository{
  Stream<PaymentModel> sendPaymentRequestToToTerminal(PaymentModel sendModel);
  //Stream<
}