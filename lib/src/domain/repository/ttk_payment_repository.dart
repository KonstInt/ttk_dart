import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_request_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_payment_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_refund_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_service_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_refund_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_service_model.dart';

abstract class TTKPaymentRepository {
  Future<ResponseOperationPaymentModel> createPayment(
      RequestPaymentModel sendModel);

  Future<ResponseOperationRefundModel> createRefund(
      RequestRefundModel sendModel);

  Future<ResponseOperationServiceModel> createServiceOperation(
      RequestServiceModel sendModel);
}
