import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_service_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/tags/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/tags/ttk_service_tags/ttk_status_code_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/enums/api_ttk_operations_types.dart';

class TagListAnalyzer {
  //TODO:check it
  bool operationSuccess(List<ApiTTKServiceTagModel> tags) {
    final index =
        tags.indexWhere((element) => element.tagName == TTKServiceTagsEnum.TA1);
    if (index > 0) {
      if (tags[index].message as String == 'Y') {
        return true;
      }
    }

    return false;
  }

  bool hasOperationResultCode(List<ApiTTKServiceTagModel> tags) {
    final index =
        tags.indexWhere((element) => element.tagName == TTKServiceTagsEnum.T9B);
    if (index > 0) {
      return true;
    }

    return false;
  }

  TTKStatusCodeEnum? getStatusCode(List<ApiTTKServiceTagModel> tags) {
    final index =
        tags.indexWhere((element) => element.tagName == TTKServiceTagsEnum.T9B);
    if (index > 0) {
      return TTKStatusCodeEnum.values[tags[index].message as int];
    }

    return null;
  }

  bool isBelongToOperation(
      {required List<ApiTTKServiceTagModel> tags,
      required String ern,
      required ApiTTKOperationType type,
      required String clientID,
      required String terminalID}) {
    bool ernFlag = false;
    bool typeFlag = false;
    bool clientNumberFlag = false;
    bool terminalIdFlag = false;
    for (final tag in tags) {
      if (tag.tagName == TTKServiceTagsEnum.T83) {
        ernFlag = (ern == tag.message as String);
      }
      if (tag.tagName == TTKServiceTagsEnum.T81) {
        typeFlag = (type == tag.message as ApiTTKOperationType);
      }
      if (tag.tagName == TTKServiceTagsEnum.T82) {
        clientNumberFlag = (clientID == tag.message as String);
      }
      if (tag.tagName == TTKServiceTagsEnum.T9D) {
        terminalIdFlag = (terminalID == tag.message as String);
      }
    }
    return ernFlag && typeFlag && terminalIdFlag && clientNumberFlag;
  }
}
