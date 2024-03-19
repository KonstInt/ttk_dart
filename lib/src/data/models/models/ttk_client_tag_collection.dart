import 'package:ttk_payment_terminal/src/data/models/enums/ttk_client_tags/ttk_client_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/enums/ttk_message_types/ttk_message_types.dart';
import 'package:ttk_payment_terminal/src/data/models/models/ttk_client_tag_model.dart';



class T01Tag extends TTKClientTagModel {
  T01Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 3,
          tagName: TTKClientTagsEnum.T01,
        );
}

class T02Tag extends TTKClientTagModel {
  T02Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 10,
          tagName: TTKClientTagsEnum.T02,
        );
}

class T03Tag extends TTKClientTagModel {
  T03Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 10,
          tagName: TTKClientTagsEnum.T03,
        );
}

class T04Tag extends TTKClientTagModel {
  T04Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 12,
          tagName: TTKClientTagsEnum.T04,
        );
}

class T08Tag extends TTKClientTagModel {
  T08Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: 8,
          tagName: TTKClientTagsEnum.T08,
        );
}

class T09Tag extends TTKClientTagModel {
  T09Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 19,
          tagName: TTKClientTagsEnum.T09,
        );
}

class T0BTag extends TTKClientTagModel {
  T0BTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 6,
          tagName: TTKClientTagsEnum.T0B,
        );
}

class T0CTag extends TTKClientTagModel {
  T0CTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 6,
          tagName: TTKClientTagsEnum.T0C,
        );
}

class T0DTag extends TTKClientTagModel {
  T0DTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKClientTagsEnum.T0D,
        );
}

class T0ETag extends TTKClientTagModel {
  T0ETag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKClientTagsEnum.T0E,
        );
}

class T18Tag extends TTKClientTagModel {
  T18Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 12,
          tagName: TTKClientTagsEnum.T18,
        );
}

class T1ATag extends TTKClientTagModel {
  T1ATag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_HEX,
          message: message,
          maxLength: 1,
          tagName: TTKClientTagsEnum.T1A,
        );
}

class T1BTag extends TTKClientTagModel {
  T1BTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 3,
          tagName: TTKClientTagsEnum.T1B,
        );
}

class T1CTag extends TTKClientTagModel {
  T1CTag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: 2,
          tagName: TTKClientTagsEnum.T1C,
        );
}

class T1DTag extends TTKClientTagModel {
  T1DTag({required dynamic message})
      : super(
          messageType: TTKMessageType.BIN,
          message: message,
          maxLength: null,
          tagName: TTKClientTagsEnum.T1D,
        );
}

class T1ETag extends TTKClientTagModel {
  T1ETag({required dynamic message})
      : super(
          messageType: TTKMessageType.BCD,
          message: message,
          maxLength: 7,
          tagName: TTKClientTagsEnum.T1E,
        );
}

class T1F00Tag extends TTKClientTagModel {
  T1F00Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII_BCD,
          message: message,
          maxLength: 1,
          tagName: TTKClientTagsEnum.T1F00,
        );
}

class T1F01Tag extends TTKClientTagModel {
  T1F01Tag({required dynamic message})
      : super(
          messageType: TTKMessageType.ASCII,
          message: message,
          maxLength: null,
          tagName: TTKClientTagsEnum.T1F01,
        );
}