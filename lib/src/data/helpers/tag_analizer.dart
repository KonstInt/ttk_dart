import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_service_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/ttk_status_code_enum.dart';

class TagListAnalyzer {
  //TODO:check it
  bool operationSuccess(Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags) {
    if (tags.containsKey(TTKServiceTagsEnum.TA1)) {
      if (tags[TTKServiceTagsEnum.TA1]!.message as String == 'Y') {
        return true;
      }
    }

    return false;
  }

  bool hasOperationResultCode(
      Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags) {
    return tags.containsKey(TTKServiceTagsEnum.T9B);
  }

  TTKStatusCodeEnum? getStatusCode(
      Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags) {
    return tags[TTKServiceTagsEnum.T9B]?.message as TTKStatusCodeEnum?;
  }

  bool isBelongToOperation(
      {required Map<TTKServiceTagsEnum, ApiTTKServiceTagModel> tags,
      required String ern,
      required ApiTTKOperationType type,
      required String clientID,
      required String terminalID}) {
    bool ernFlag = false;
    bool typeFlag = false;
    bool clientNumberFlag = false;
    bool terminalIdFlag = false;

    if (tags.containsKey(TTKServiceTagsEnum.T83)) {
      ernFlag = (ern == tags[TTKServiceTagsEnum.T83]!.message as String);
    }
    if (tags.containsKey(TTKServiceTagsEnum.T81)) {
      typeFlag = (type ==
          tags[TTKServiceTagsEnum.T81]!.message as ApiTTKOperationType);
    }
    if (tags.containsKey(TTKServiceTagsEnum.T82)) {
      clientNumberFlag =
          (clientID == tags[TTKServiceTagsEnum.T82]!.message as String);
    }
    if (tags.containsKey(TTKServiceTagsEnum.T9D)) {
      terminalIdFlag =
          (terminalID == tags[TTKServiceTagsEnum.T9D]!.message as String);
    }

    return ernFlag && typeFlag && terminalIdFlag && clientNumberFlag;
  }
}
