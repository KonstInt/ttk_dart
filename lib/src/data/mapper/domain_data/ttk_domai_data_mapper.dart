import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operation_service_type.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_refund_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_service_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_refund_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_service_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_payment_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_refund_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_service_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_refund_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_service_model.dart';

class TTKDomainDataMapper {
  static ApiPaymentModel paymentModelToApi(RequestPaymentModel model) {
    return ApiPaymentModel(
        amount: model.amount,
        clientId: model.clientId,
        idempotenceKeyERN: model.idempotenceKeyERN);
  }

  static ApiRefundModel refundModelToApi(RequestRefundModel model) {
    return ApiRefundModel(
        amount: model.amount,
        retrievalReferenceNumber: model.retrievalReferenceNumber,
        clientId: model.clientId,
        idempotenceKeyERN: model.idempotenceKeyERN);
  }

  static ApiServiceModel serviceModelToApi(RequestServiceModel model) {
    return ApiServiceModel(
        clientId: model.clientId,
        idempotenceKeyERN: model.idempotenceKeyERN,
        serviceType: ApiTTKOperationServiceType.values
            .firstWhere((element) => element.value == model.serviceType.value));
  }

  ///FROM API
  static ResponseOperationPaymentModel paymentModelFromApi(
      ApiResultPaymentModel model) {
    return ResponseOperationPaymentModel(
      amount: model.amount,
      clientId: model.clientId,
      idempotenceKeyERN: model.idempotenceKeyERN,
      operationType: OperationType.values
          .firstWhere((element) => element.name == model.operationType.name),
      success: model.success,
      date: model.date,
      time: model.time,
      retrievalReferenceNumber: model.retrievalReferenceNumber,
      receipt: model.receipt,
    );
  }

  static ResponseOperationRefundModel refundModelFromApi(
      ApiResultRefundModel model) {
    return ResponseOperationRefundModel(
      amount: model.amount,
      clientId: model.clientId,
      idempotenceKeyERN: model.idempotenceKeyERN,
      operationType: OperationType.values
          .firstWhere((element) => element.name == model.operationType.name),
      success: model.success,
      date: model.date,
      time: model.time,
      receipt: model.receipt,
    );
  }

  static ResponseOperationServiceModel serviceModelFromApi(
      ApiResultServiceModel model) {
    return ResponseOperationServiceModel(
      clientId: model.clientId,
      idempotenceKeyERN: model.idempotenceKeyERN,
      operationType: OperationType.values
          .firstWhere((element) => element.name == model.operationType.name),
      success: model.success,
      date: model.date,
      time: model.time,
      receipt: model.receipt,
    );
  }
}
