import 'package:ttk_payment_terminal/src/data/models/enums/ttk_message_types/ttk_message_types.dart';
import 'package:ttk_payment_terminal/src/data/models/enums/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/models/ttk_service_tag_model.dart';

class T81Tag extends TTKServiceTagModel {
  T81Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 3,
          tagName: TTKServiceTagsEnum.T81,
        );
}

class T82Tag extends TTKServiceTagModel {
  T82Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 10,
          tagName: TTKServiceTagsEnum.T82,
        );
}

class T83Tag extends TTKServiceTagModel {
  T83Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 10,
          tagName: TTKServiceTagsEnum.T83,
        );
}

class T9BTag extends TTKServiceTagModel {
  T9BTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 3,
          tagName: TTKServiceTagsEnum.T9B,
        );
}

class T84Tag extends TTKServiceTagModel {
  T84Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 12,
          tagName: TTKServiceTagsEnum.T84,
        );
}

class T89Tag extends TTKServiceTagModel {
  T89Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 19,
          tagName: TTKServiceTagsEnum.T89,
        );
}

class T8BTag extends TTKServiceTagModel {
  T8BTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 6,
          tagName: TTKServiceTagsEnum.T8B,
        );
}

class T8CTag extends TTKServiceTagModel {
  T8CTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 6,
          tagName: TTKServiceTagsEnum.T8C,
        );
}

class T8DTag extends TTKServiceTagModel {
  T8DTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 8,
          tagName: TTKServiceTagsEnum.T8D,
        );
}

class T8ETag extends TTKServiceTagModel {
  T8ETag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 6,
          tagName: TTKServiceTagsEnum.T8E,
        );
}

class T8FTag extends TTKServiceTagModel {
  T8FTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 18,
          tagName: TTKServiceTagsEnum.T8F,
        );
}

class T90Tag extends TTKServiceTagModel {
  T90Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 15,
          tagName: TTKServiceTagsEnum.T90,
        );
}

class T92Tag extends TTKServiceTagModel {
  T92Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_HEX,
          message: message,
          maxLength: 3,
          tagName: TTKServiceTagsEnum.T92,
        );
}

class T93Tag extends TTKServiceTagModel {
  T93Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_HEX,
          message: message,
          maxLength: 2,
          tagName: TTKServiceTagsEnum.T93,
        );
}

class T94Tag extends TTKServiceTagModel {
  T94Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 1,
          tagName: TTKServiceTagsEnum.T94,
        );
}

class T95Tag extends TTKServiceTagModel {
  T95Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: 5,
          tagName: TTKServiceTagsEnum.T95,
        );
}

class T98Tag extends TTKServiceTagModel {
  T98Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 12,
          tagName: TTKServiceTagsEnum.T98,
        );
}

class T99Tag extends TTKServiceTagModel {
  T99Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 6,
          tagName: TTKServiceTagsEnum.T99,
        );
}

class T9DTag extends TTKServiceTagModel {
  T9DTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 8,
          tagName: TTKServiceTagsEnum.T9D,
        );
}
class T9ETag extends TTKServiceTagModel {
  T9ETag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.T9E,
        );
}

class T9F0ETag extends TTKServiceTagModel {
  T9F0ETag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.T9F0E,
        );
}

class T9F06Tag extends TTKServiceTagModel {
  T9F06Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: 8,
          tagName: TTKServiceTagsEnum.T9F06,
        );
}

class T9F26Tag extends TTKServiceTagModel {
  T9F26Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: 8,
          tagName: TTKServiceTagsEnum.T9F26,
        );
}

class TAOtag extends TTKServiceTagModel {
  TAOtag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 41,
          tagName: TTKServiceTagsEnum.TAO,
        );
}

class TA1Tag extends TTKServiceTagModel {
  TA1Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 1,
          tagName: TTKServiceTagsEnum.TA1,
        );
}

class TA2Tag extends TTKServiceTagModel {
  TA2Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 12,
          tagName: TTKServiceTagsEnum.TA2,
        );
}

class T50Tag extends TTKServiceTagModel {
  T50Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 16,
          tagName: TTKServiceTagsEnum.T50,
        );
}

class TC1Tag extends TTKServiceTagModel {
  TC1Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 3,
          tagName: TTKServiceTagsEnum.TC1,
        );
}

class TC2Tag extends TTKServiceTagModel {
  TC2Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 1,
          tagName: TTKServiceTagsEnum.TC2,
        );
}

class TCDTag extends TTKServiceTagModel {
  TCDTag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.TCD,
        );
}

class TCETag extends TTKServiceTagModel {
  TCETag({required dynamic message})
      : super(
          messageType: TTKMessageType.BCD,
          message: message,
          maxLength: 7,
          tagName: TTKServiceTagsEnum.TCE,
        );
}

class T1F70Tag extends TTKServiceTagModel {
  T1F70Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 3,
          tagName: TTKServiceTagsEnum.T1F70,
        );
}

class T1F71Tag extends TTKServiceTagModel {
  T1F71Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.T1F71,
        );
}

class T1F72Tag extends TTKServiceTagModel {
  T1F72Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 3,
          tagName: TTKServiceTagsEnum.T1F72,
        );
}

class T1F73Tag extends TTKServiceTagModel {
  T1F73Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 2,
          tagName: TTKServiceTagsEnum.T1F73,
        );
}

class T1F74Tag extends TTKServiceTagModel {
  T1F74Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 2,
          tagName: TTKServiceTagsEnum.T1F74,
        );
}

class T1F75Tag extends TTKServiceTagModel {
  T1F75Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 1,
          tagName: TTKServiceTagsEnum.T1F75,
        );
}

class T1F76Tag extends TTKServiceTagModel {
  T1F76Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.T1F76,
        );
}

class T1F77Tag extends TTKServiceTagModel {
  T1F77Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.T1F77,
        );
}

class T1F78Tag extends TTKServiceTagModel {T1F78Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.T1F78,
        );
}

class T1F79Tag extends TTKServiceTagModel {
  T1F79Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 3,
          tagName: TTKServiceTagsEnum.T1F79,
        );
}

class T1F7ATag extends TTKServiceTagModel {
  T1F7ATag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 1,
          tagName: TTKServiceTagsEnum.T1F7A,
        );
}

class T1F7BTag extends TTKServiceTagModel {
  T1F7BTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKServiceTagsEnum.T1F7B,
        );
}

class T1F7CTag extends TTKServiceTagModel {
  T1F7CTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 6,
          tagName: TTKServiceTagsEnum.T1F7C,
        );
}