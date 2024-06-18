import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operation_service_type.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_payment_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_refund_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_service_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_abort_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_payment_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_refund_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_service_model.dart';
import 'package:pos_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_abort_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_service_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_service_model.dart';

class POSDomainDataMapper {
  //TO API
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
        serviceType: ApiPOSOperationServiceType.values
            .firstWhere((element) => element.value == model.serviceType.value));
  }

  static ApiAbortModel abortModelToApi(RequestAbortModel model) {
    return ApiAbortModel(
      clientId: model.clientId,
      idempotenceKeyERN: model.idempotenceKeyERN,
    );
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
