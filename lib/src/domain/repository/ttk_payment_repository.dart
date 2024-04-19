import 'package:ttk_payment_terminal/src/data/models/operations/api_payment_model.dart';

abstract class TTKPaymentRepository {
  Stream<ApiPaymentModel> sendPaymentRequestToToTerminal(ApiPaymentModel sendModel);
}
