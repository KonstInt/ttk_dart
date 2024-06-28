import 'package:pos_payment_terminal/src/data/repository/pos_repository.dart';
import 'package:pos_payment_terminal/src/domain/models/enums/response/operation_service_type.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_abort_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_service_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_service_model.dart';
import 'package:pos_payment_terminal/src/domain/repository/pos_payment_repository.dart';

class POSPaymentModule {
  POSPaymentModule({required this.ip, required this.port}) {
    repository = ApiPOSPaymentRepository(ip: ip, port: port);
  }

  late POSPaymentRepository repository;
  int port;
  String ip;

  Future<bool> connect() async {
    return repository.connect();
  }

  Future<bool> disconnect() async {
    return repository.disconnect();
  }

  Future<ResponseOperationPaymentModel> createPayment({
    required double amount,
    required String clientId,
    required String idempotenceKeyERN,
    required int? organizationCode,
  }) async {
    final sendModel = RequestPaymentModel(
        organizationCode: organizationCode,
        amount: amount,
        clientId: clientId,
        idempotenceKeyERN: idempotenceKeyERN);
    return repository.createPayment(sendModel);
  }

  Future<ResponseOperationRefundModel> createRefund(
      {required double amount,
      required String retrievalReferenceNumber,
      required String clientId,
      required int? organizationCode,
      required String idempotenceKeyERN}) async {
    final sendModel = RequestRefundModel(
      organizationCode: organizationCode,
      amount: amount,
      retrievalReferenceNumber: retrievalReferenceNumber,
      clientId: clientId,
      idempotenceKeyERN: idempotenceKeyERN,
    );
    return repository.createRefund(sendModel);
  }

  Future<ResponseOperationServiceModel> createService(
      {required String clientId,
      required int? organizationCode,
      required OperationServiceType operationServiceType,
      required String idempotenceKeyERN}) async {
    final sendModel = RequestServiceModel(
      organizationCode: organizationCode,
      serviceType: operationServiceType,
      clientId: clientId,
      idempotenceKeyERN: idempotenceKeyERN,
    );
    return repository.createServiceOperation(sendModel);
  }

  bool createAbort(
      {required int? organizationCode,
      required String clientId,
      required String idempotenceKeyERN}) {
    final sendModel = RequestAbortModel(
      organizationCode: organizationCode,
      clientId: clientId,
      idempotenceKeyERN: idempotenceKeyERN,
    );
    return repository.createAbort(sendModel);
  }
}
