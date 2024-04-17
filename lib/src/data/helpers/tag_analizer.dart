import 'package:ttk_payment_terminal/src/data/models/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/models/base_models/ttk_service_tag_model.dart';
import 'package:ttk_payment_terminal/src/domain/models/enums/ttk_operations_types.dart';

class TagListAnalyzer{
  bool hasDeniedCode(List<List<TTKServiceTagModel>> tags){
    for(final tagList in tags){
      final index = tagList.indexWhere((element) => element.tagName == TTKServiceTagsEnum.T9B);
      if(index>0){
        return true;
      }
    }
  }



  bool isBelong({required List<TTKServiceTagModel> tags, required String ern, required TTKOperationType type}){
    bool ernFlag = false;
    bool typeFlag = false; 
     for(var tag in tags){
        if(tag.tagName == TTKServiceTagsEnum.T83){
          ernFlag = (ern == tag.message as String);
        }
        if(tag.tagName == TTKServiceTagsEnum.T81){
          typeFlag = (type == tag.message as TTKOperationType);
        }
     }
     return ernFlag && typeFlag;      
  }
}