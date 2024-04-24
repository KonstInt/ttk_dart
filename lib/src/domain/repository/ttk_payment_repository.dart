import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_request_model.dart';

abstract class TTKPaymentRepository {
  Stream<ApiRequestModel> sendPaymentRequestToToTerminal(
      ApiRequestModel sendModel);
}
