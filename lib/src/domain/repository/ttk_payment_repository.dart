import 'package:ttk_payment_terminal/src/data/models/operations/api_request_model.dart';

abstract class TTKPaymentRepository {
  Stream<ApiRequestModel> sendPaymentRequestToToTerminal(ApiRequestModel sendModel);
}
