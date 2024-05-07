import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_refund_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_service_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_refund_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_service_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_client_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_service_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/tags/ttk_client_tags/ttk_client_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';

class TTKApiResultMapper {
  //PAYMENT
  static ApiResultPaymentModel resultPaymentModelFromAPI(
      Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags) {
    return ApiResultPaymentModel(
      clientId: tags[TTKServiceTagsEnum.T82]!.message as String,
      idempotenceKeyERN: tags[TTKServiceTagsEnum.T83]!.message as String,
      operationType: ApiTTKOperationType.values.firstWhere((element) =>
          element.name == tags[TTKServiceTagsEnum.T81]!.message as String),
      success: tags[TTKServiceTagsEnum.TA1]!.message as String == 'Y',
      date: tags[TTKServiceTagsEnum.T8D]!.message as String,
      time: tags[TTKServiceTagsEnum.T8E]!.message as String,
      amount: int.parse(tags[TTKServiceTagsEnum.T84]!.message as String) / 100,
      retrievalReferenceNumber: tags[TTKServiceTagsEnum.T98]?.message as String?,
      receipt: tags[TTKServiceTagsEnum.T9C]?.message as String?,
    );
  }

  static Map<TTKClientTagsEnum, ApiTTKClientTagModel> paymentModelToAPI(
      ApiPaymentModel paymentModel) {
    return <TTKClientTagsEnum, ApiTTKClientTagModel>{
      TTKClientTagsEnum.T01: ApiTTKClientTagModel(
        message: paymentModel.operationType.name,
        tagName: TTKClientTagsEnum.T01,
      ),
      TTKClientTagsEnum.T02: ApiTTKClientTagModel(
        message: paymentModel.clientId,
        tagName: TTKClientTagsEnum.T02,
      ),
      TTKClientTagsEnum.T03: ApiTTKClientTagModel(
        message: paymentModel.idempotenceKeyERN,
        tagName: TTKClientTagsEnum.T03,
      ),
      TTKClientTagsEnum.T04: ApiTTKClientTagModel(
        message: (paymentModel.amount * 100 ~/ 1).toString(),
        tagName: TTKClientTagsEnum.T04,
      ),
    };
  }

  //Refund
  static ApiResultRefundModel resultRefundModelFromAPI(
      Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags) {
    return ApiResultRefundModel(
      clientId: tags[TTKServiceTagsEnum.T82]!.message as String,
      idempotenceKeyERN: tags[TTKServiceTagsEnum.T83]!.message as String,
      operationType: ApiTTKOperationType.values.firstWhere((element) =>
          element.name == tags[TTKServiceTagsEnum.T81]!.message as String),
      success: tags[TTKServiceTagsEnum.TA1]!.message as String == 'Y',
      date: tags[TTKServiceTagsEnum.T8D]!.message as String,
      time: tags[TTKServiceTagsEnum.T8E]!.message as String,
      amount: int.parse(tags[TTKServiceTagsEnum.T84]!.message as String) / 100,
      receipt: tags[TTKServiceTagsEnum.T9C]?.message as String,
    );
  }

  static Map<TTKClientTagsEnum, ApiTTKClientTagModel> refundModelToAPI(
      ApiRefundModel refundModel) {
    return <TTKClientTagsEnum, ApiTTKClientTagModel>{
      TTKClientTagsEnum.T01: ApiTTKClientTagModel(
        message: refundModel.operationType.name,
        tagName: TTKClientTagsEnum.T01,
      ),
      TTKClientTagsEnum.T02: ApiTTKClientTagModel(
        message: refundModel.clientId,
        tagName: TTKClientTagsEnum.T02,
      ),
      TTKClientTagsEnum.T03: ApiTTKClientTagModel(
        message: refundModel.idempotenceKeyERN,
        tagName: TTKClientTagsEnum.T03,
      ),
      TTKClientTagsEnum.T04: ApiTTKClientTagModel(
        message: (refundModel.amount * 100 ~/ 1).toString(),
        tagName: TTKClientTagsEnum.T04,
      ),
      TTKClientTagsEnum.T18: ApiTTKClientTagModel(
        message: refundModel.retrievalReferenceNumber,
        tagName: TTKClientTagsEnum.T18,
      ),
    };
  }

  //Service operation
  static ApiResultServiceModel resultServiceModelFromAPI(
      Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags) {
    return ApiResultServiceModel(
      clientId: tags[TTKServiceTagsEnum.T82]!.message as String,
      idempotenceKeyERN: tags[TTKServiceTagsEnum.T83]!.message as String,
      operationType: ApiTTKOperationType.values.firstWhere((element) =>
          element.name == tags[TTKServiceTagsEnum.T81]!.message as String),
      success: tags[TTKServiceTagsEnum.TA1]!.message as String == 'Y',
      date: tags[TTKServiceTagsEnum.T8D]!.message as String,
      time: tags[TTKServiceTagsEnum.T8E]!.message as String,
      receipt: tags[TTKServiceTagsEnum.T9C]!.message as String,
    );
  }

  static Map<TTKClientTagsEnum, ApiTTKClientTagModel> serviceModelToAPI(
      ApiServiceModel serviceModel) {
    return <TTKClientTagsEnum, ApiTTKClientTagModel>{
      TTKClientTagsEnum.T01: ApiTTKClientTagModel(
        message: serviceModel.operationType.name,
        tagName: TTKClientTagsEnum.T01,
      ),
      TTKClientTagsEnum.T02: ApiTTKClientTagModel(
        message: serviceModel.clientId,
        tagName: TTKClientTagsEnum.T02,
      ),
      TTKClientTagsEnum.T03: ApiTTKClientTagModel(
        message: serviceModel.idempotenceKeyERN,
        tagName: TTKClientTagsEnum.T03,
      ),
      TTKClientTagsEnum.T1A: ApiTTKClientTagModel(
        message: serviceModel.serviceType.value,
        tagName: TTKClientTagsEnum.T1A,
      ),
    };
  }
}
