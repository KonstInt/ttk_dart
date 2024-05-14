import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';
import 'package:pos_payment_terminal/src/data/models/pos/base_models/api_pos_service_tag_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_service_tags/pos_service_tags_enum.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/pos_status_code_enum.dart';

class TagListAnalyzer {
  static bool operationSuccess(
      Map<POSServiceTagsEnum, ApiPOSServiceTagModel> tags) {
    if (tags.containsKey(POSServiceTagsEnum.TA1)) {
      if (tags[POSServiceTagsEnum.TA1]!.message as String == 'Y') {
        return true;
      }
    }

    return false;
  }

  static bool hasOperationResultCode(
      Map<POSServiceTagsEnum, ApiPOSServiceTagModel> tags) {
    return tags.containsKey(POSServiceTagsEnum.T9B);
  }

  static POSStatusCodeEnum? getStatusCode(
      Map<POSServiceTagsEnum, ApiPOSServiceTagModel> tags) {
    return tags[POSServiceTagsEnum.T9B]?.message as POSStatusCodeEnum?;
  }

  static bool isBelongToOperation({
    required Map<POSServiceTagsEnum, ApiPOSServiceTagModel> tags,
    required String ern,
    required ApiPOSOperationType type,
    required String clientID,
    /* required String terminalID*/
  }) {
    bool ernFlag = false;
    bool typeFlag = false;
    bool clientNumberFlag = false;
    //bool terminalIdFlag = false;

    if (tags.containsKey(POSServiceTagsEnum.T83)) {
      ernFlag = (ern == tags[POSServiceTagsEnum.T83]!.message as String);
    }
    if (tags.containsKey(POSServiceTagsEnum.T81)) {
      typeFlag = (type ==
          ApiPOSOperationType.values.firstWhere((element) =>
              element.name ==
              (tags[POSServiceTagsEnum.T81]!.message as String)));
    }
    if (tags.containsKey(POSServiceTagsEnum.T82)) {
      clientNumberFlag =
          (clientID == tags[POSServiceTagsEnum.T82]!.message as String);
    }
    // if (tags.containsKey(POSServiceTagsEnum.T9D)) {
    //   terminalIdFlag =
    //       (terminalID == tags[POSServiceTagsEnum.T9D]!.message as String);
    // }

    return ernFlag && typeFlag && clientNumberFlag; // &&terminalIdFlag ;
  }
}
