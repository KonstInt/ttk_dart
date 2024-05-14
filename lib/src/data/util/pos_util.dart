import 'package:pos_payment_terminal/src/data/mapper/domain_data/pos_domai_data_mapper.dart';
import 'package:pos_payment_terminal/src/data/service/pos_service.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_service_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_refund_model.dart';
import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_service_model.dart';

class POSUtil {
  POSUtil({required this.ip, required this.port}) {
    service = POSService(ip: ip, port: port);
  }
  String ip;
  int port;
  late POSService service;

  Future<ResponseOperationPaymentModel> createPayment(
      RequestPaymentModel sendModel) async {
    final apiLevelModel = POSDomainDataMapper.paymentModelToApi(sendModel);
    final response = await service.createPayment(apiLevelModel);
    return POSDomainDataMapper.paymentModelFromApi(response);
  }

  Future<bool> connectToPOS() async {
    return service.posSocketConnect();
  }

  Future<bool> disconnectWithPOS() async {
    return service.posSocketDisconnect();
  }

  Future<ResponseOperationRefundModel> createRefund(
      RequestRefundModel sendModel) async {
    final apiLevelModel = POSDomainDataMapper.refundModelToApi(sendModel);
    final response = await service.createRefund(apiLevelModel);
    return POSDomainDataMapper.refundModelFromApi(response);
  }

  Future<ResponseOperationServiceModel> createServiceOperation(
      RequestServiceModel sendModel) async {
    final apiLevelModel = POSDomainDataMapper.serviceModelToApi(sendModel);
    final response = await service.createServiceOperation(apiLevelModel);
    return POSDomainDataMapper.serviceModelFromApi(response);
  }
}
