import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_payment_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_refund_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/from_pos/api_result_service_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_abort_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_payment_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_refund_model.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_service_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/base_models/api_pos_client_tag_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/base_models/api_pos_service_tag_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_client_tags/pos_client_tags_enum.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_service_tags/pos_service_tags_enum.dart';

class POSApiResultMapper {
  //PAYMENT
  static ApiResultPaymentModel resultPaymentModelFromAPI(
      Map<POSServiceTagsEnum, ApiPOSServiceTagModel> tags) {
    return ApiResultPaymentModel(
      clientId: tags[POSServiceTagsEnum.T82]!.message as String,
      idempotenceKeyERN: tags[POSServiceTagsEnum.T83]!.message as String,
      operationType: ApiPOSOperationType.values.firstWhere((element) =>
          element.name == tags[POSServiceTagsEnum.T81]!.message as String),
      success: tags[POSServiceTagsEnum.TA1]!.message as String == 'Y',
      date: tags[POSServiceTagsEnum.T8D]!.message as String,
      time: tags[POSServiceTagsEnum.T8E]!.message as String,
      amount: int.parse(tags[POSServiceTagsEnum.T84]!.message as String) / 100,
      retrievalReferenceNumber:
          tags[POSServiceTagsEnum.T98]?.message as String?,
      receipt: tags[POSServiceTagsEnum.T9C]?.message as String?,
    );
  }

  static Map<POSClientTagsEnum, ApiPOSClientTagModel> paymentModelToAPI(
      ApiPaymentModel paymentModel) {
    return <POSClientTagsEnum, ApiPOSClientTagModel>{
      POSClientTagsEnum.T01: ApiPOSClientTagModel(
        message: paymentModel.operationType.name,
        tagName: POSClientTagsEnum.T01,
      ),
      POSClientTagsEnum.T02: ApiPOSClientTagModel(
        message: paymentModel.clientId,
        tagName: POSClientTagsEnum.T02,
      ),
      POSClientTagsEnum.T03: ApiPOSClientTagModel(
        message: paymentModel.idempotenceKeyERN,
        tagName: POSClientTagsEnum.T03,
      ),
      POSClientTagsEnum.T04: ApiPOSClientTagModel(
        message: (paymentModel.amount * 100 ~/ 1).toString(),
        tagName: POSClientTagsEnum.T04,
      ),
    };
  }

  //Refund
  static ApiResultRefundModel resultRefundModelFromAPI(
      Map<POSServiceTagsEnum, ApiPOSServiceTagModel> tags) {
    return ApiResultRefundModel(
      clientId: tags[POSServiceTagsEnum.T82]!.message as String,
      idempotenceKeyERN: tags[POSServiceTagsEnum.T83]!.message as String,
      operationType: ApiPOSOperationType.values.firstWhere((element) =>
          element.name == tags[POSServiceTagsEnum.T81]!.message as String),
      success: tags[POSServiceTagsEnum.TA1]!.message as String == 'Y',
      date: tags[POSServiceTagsEnum.T8D]!.message as String,
      time: tags[POSServiceTagsEnum.T8E]!.message as String,
      amount: int.parse(tags[POSServiceTagsEnum.T84]!.message as String) / 100,
      receipt: tags[POSServiceTagsEnum.T9C]?.message as String?,
    );
  }

  static Map<POSClientTagsEnum, ApiPOSClientTagModel> refundModelToAPI(
      ApiRefundModel refundModel) {
    return <POSClientTagsEnum, ApiPOSClientTagModel>{
      POSClientTagsEnum.T01: ApiPOSClientTagModel(
        message: refundModel.operationType.name,
        tagName: POSClientTagsEnum.T01,
      ),
      POSClientTagsEnum.T02: ApiPOSClientTagModel(
        message: refundModel.clientId,
        tagName: POSClientTagsEnum.T02,
      ),
      POSClientTagsEnum.T03: ApiPOSClientTagModel(
        message: refundModel.idempotenceKeyERN,
        tagName: POSClientTagsEnum.T03,
      ),
      POSClientTagsEnum.T04: ApiPOSClientTagModel(
        message: (refundModel.amount * 100 ~/ 1).toString(),
        tagName: POSClientTagsEnum.T04,
      ),
      POSClientTagsEnum.T18: ApiPOSClientTagModel(
        message: refundModel.retrievalReferenceNumber,
        tagName: POSClientTagsEnum.T18,
      ),
    };
  }

  //Service operation
  static ApiResultServiceModel resultServiceModelFromAPI(
      Map<POSServiceTagsEnum, ApiPOSServiceTagModel> tags) {
    return ApiResultServiceModel(
      clientId: tags[POSServiceTagsEnum.T82]!.message as String,
      idempotenceKeyERN: tags[POSServiceTagsEnum.T83]!.message as String,
      operationType: ApiPOSOperationType.values.firstWhere((element) =>
          element.name == tags[POSServiceTagsEnum.T81]!.message as String),
      success: tags[POSServiceTagsEnum.TA1]!.message as String == 'Y',
      date: tags[POSServiceTagsEnum.T8D]!.message as String,
      time: tags[POSServiceTagsEnum.T8E]!.message as String,
      receipt: tags[POSServiceTagsEnum.T9C]?.message as String?,
    );
  }

  static Map<POSClientTagsEnum, ApiPOSClientTagModel> serviceModelToAPI(
      ApiServiceModel serviceModel) {
    return <POSClientTagsEnum, ApiPOSClientTagModel>{
      POSClientTagsEnum.T01: ApiPOSClientTagModel(
        message: serviceModel.operationType.name,
        tagName: POSClientTagsEnum.T01,
      ),
      POSClientTagsEnum.T02: ApiPOSClientTagModel(
        message: serviceModel.clientId,
        tagName: POSClientTagsEnum.T02,
      ),
      POSClientTagsEnum.T03: ApiPOSClientTagModel(
        message: serviceModel.idempotenceKeyERN,
        tagName: POSClientTagsEnum.T03,
      ),
      POSClientTagsEnum.T1A: ApiPOSClientTagModel(
        message: serviceModel.serviceType.value,
        tagName: POSClientTagsEnum.T1A,
      ),
    };
  }

  //Abort operation
  static Map<POSClientTagsEnum, ApiPOSClientTagModel> abortModelToAPI(
      ApiAbortModel abortModel) {
    return <POSClientTagsEnum, ApiPOSClientTagModel>{
      POSClientTagsEnum.T01: ApiPOSClientTagModel(
        message: abortModel.operationType.name,
        tagName: POSClientTagsEnum.T01,
      ),
      POSClientTagsEnum.T02: ApiPOSClientTagModel(
        message: abortModel.clientId,
        tagName: POSClientTagsEnum.T02,
      ),
      POSClientTagsEnum.T03: ApiPOSClientTagModel(
        message: abortModel.idempotenceKeyERN,
        tagName: POSClientTagsEnum.T03,
      ),
    };
  }
}
