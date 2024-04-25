import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_payment_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_service_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';

class TTKApiMapper{
  ApiResultPaymentModel paymentModelFromAPI(Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags){
    return ApiResultPaymentModel(clientId: clientId, idempotenceKeyERN: idempotenceKeyERN, operationType: operationType, success: success, date: date, time: time, amount: amount, retrievalReferenceNumber: retrievalReferenceNumber)
  }
}