import 'package:pos_payment_terminal/src/data/util/pos_util.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_service_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_service_model.dart';
import 'package:pos_payment_terminal/src/domain/repository/pos_payment_repository.dart';

class ApiPOSPaymentRepository extends POSPaymentRepository {
  ApiPOSPaymentRepository({required this.ip, required this.port}) {
    util = POSUtil(ip: ip, port: port);
  }
  String ip;
  int port;
  late POSUtil util;
  @override
  Future<ResponseOperationPaymentModel> createPayment(
      RequestPaymentModel sendModel) {
    return util.createPayment(sendModel);
  }

  @override
  Future<ResponseOperationRefundModel> createRefund(
      RequestRefundModel sendModel) {
    return util.createRefund(sendModel);
  }

  @override
  Future<ResponseOperationServiceModel> createServiceOperation(
      RequestServiceModel sendModel) {
    return util.createServiceOperation(sendModel);
  }

  @override
  Future<bool> connect() {
    return util.connectToPOS();
  }

  @override
  Future<bool> disconnect() {
    return util.disconnectWithPOS();
  }
}
