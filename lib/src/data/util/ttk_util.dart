import 'package:ttk_payment_terminal/src/domain/models/request_models/request_payment_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_refund_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_service_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_refund_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_service_model.dart';

class TTKUtil{
   
  static Future<ResponseOperationPaymentModel> createPayment(RequestPaymentModel sendModel) {
    // TODO: implement createPayment
    throw UnimplementedError();
  }

  
  static Future<ResponseOperationRefundModel> createRefund(RequestRefundModel sendModel) {
    // TODO: implement createRefund
    throw UnimplementedError();
  }

  
  static Future<ResponseOperationServiceModel> createServiceOperation(RequestServiceModel sendModel) {
    // TODO: implement createServiceOperation
    throw UnimplementedError();
  }

}