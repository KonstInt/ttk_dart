import 'package:ttk_payment_terminal/src/data/models/ttk/tags/ttk_client_tags/ttk_client_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/tags/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/ttk_message_types/ttk_message_types.dart';

class TagAdditionalInformationGetter {
  static (int?, TTKMessageType) getAdditionalInfoOfServiceTags(
      TTKServiceTagsEnum tagType) {
    late final int? _maxLength;
    late final TTKMessageType _messageType;
    switch (tagType) {
      case TTKServiceTagsEnum.T81:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 3;
        break;
      case TTKServiceTagsEnum.T82:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 10;
        break;
      case TTKServiceTagsEnum.T83:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 10;
        break;
      case TTKServiceTagsEnum.T9B:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 3;
        break;
      case TTKServiceTagsEnum.T84:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 12;
        break;
      case TTKServiceTagsEnum.T89:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 19;
        break;
      case TTKServiceTagsEnum.T8B:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 6;
        break;
      case TTKServiceTagsEnum.T8C:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 6;
        break;
      case TTKServiceTagsEnum.T8D:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 8;
        break;
      case TTKServiceTagsEnum.T8E:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 6;
        break;
      case TTKServiceTagsEnum.T8F:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 18;
        break;
      case TTKServiceTagsEnum.T90:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 15;
        break;
      case TTKServiceTagsEnum.T92:
        _messageType = TTKMessageType.ASCII_HEX;
        _maxLength = 3;
        break;
      case TTKServiceTagsEnum.T93:
        _messageType = TTKMessageType.ASCII_HEX;
        _maxLength = 2;
        break;
      case TTKServiceTagsEnum.T94:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 1;
        break;
      case TTKServiceTagsEnum.T95:
        _messageType = TTKMessageType.BIN;
        _maxLength = 5;
        break;
      case TTKServiceTagsEnum.T98:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 12;
        break;
      case TTKServiceTagsEnum.T99:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 6;
        break;
      case TTKServiceTagsEnum.T9D:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 8;
        break;
      case TTKServiceTagsEnum.T9E:
        _messageType = TTKMessageType.BIN;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T9F0E:
        _messageType = TTKMessageType.BIN;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T9F06:
        _messageType = TTKMessageType.BIN;
        _maxLength = 8;
        break;
      case TTKServiceTagsEnum.T9F26:
        _messageType = TTKMessageType.BIN;
        _maxLength = 8;
        break;
      case TTKServiceTagsEnum.TA0:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 41;
        break;
      case TTKServiceTagsEnum.TA1:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 1;
        break;
      case TTKServiceTagsEnum.TA2:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 12;
        break;
      case TTKServiceTagsEnum.T50:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 16;
        break;
      case TTKServiceTagsEnum.TC1:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 3;
        break;
      case TTKServiceTagsEnum.TC2:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 1;
        break;
      case TTKServiceTagsEnum.TCD:
        _messageType = TTKMessageType.BIN;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.TCE:
        _messageType = TTKMessageType.BCD;
        _maxLength = 7;
        break;
      case TTKServiceTagsEnum.T1F70:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 3;
        break;
      case TTKServiceTagsEnum.T1F71:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T1F72:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 3;
        break;
      case TTKServiceTagsEnum.T1F73:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 2;
        break;
      case TTKServiceTagsEnum.T1F74:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 2;
        break;
      case TTKServiceTagsEnum.T1F75:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 1;
        break;
      case TTKServiceTagsEnum.T1F76:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T1F77:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T1F78:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T1F79:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 3;
        break;
      case TTKServiceTagsEnum.T1F7A:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 1;
        break;
      case TTKServiceTagsEnum.T1F7B:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T1F7C:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 6;
        break;
      case TTKServiceTagsEnum.TUnknown:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKServiceTagsEnum.T5F05:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 8;
      case TTKServiceTagsEnum.T9C:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
    }

    return (_maxLength, _messageType);
  }

  static (int?, TTKMessageType) getAdditionalInfoOfClientTags(
      TTKClientTagsEnum tagType) {
    late final int? _maxLength;
    late final TTKMessageType _messageType;
    switch (tagType) {
      case TTKClientTagsEnum.T01:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 3;
        break;
      case TTKClientTagsEnum.T02:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 10;
        break;
      case TTKClientTagsEnum.T03:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 10;
        break;
      case TTKClientTagsEnum.T04:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 12;
        break;
      case TTKClientTagsEnum.T08:
        _messageType = TTKMessageType.BIN;
        _maxLength = 8;
        break;
      case TTKClientTagsEnum.T09:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 19;
        break;
      case TTKClientTagsEnum.T0B:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 6;
        break;
      case TTKClientTagsEnum.T0C:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 6;
        break;
      case TTKClientTagsEnum.T0D:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKClientTagsEnum.T0E:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
      case TTKClientTagsEnum.T18:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 12;
        break;
      case TTKClientTagsEnum.T1A:
        _messageType = TTKMessageType.ASCII_HEX;
        _maxLength = 1;
        break;
      case TTKClientTagsEnum.T1B:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 3;
        break;
      case TTKClientTagsEnum.T1C:
        _messageType = TTKMessageType.ASCII;
        _maxLength = 2;
        break;
      case TTKClientTagsEnum.T1D:
        _messageType = TTKMessageType.BIN;
        _maxLength = null;
        break;
      case TTKClientTagsEnum.T1E:
        _messageType = TTKMessageType.BCD;
        _maxLength = 7;
        break;
      case TTKClientTagsEnum.T1F00:
        _messageType = TTKMessageType.ASCII_BCD;
        _maxLength = 1;
        break;
      case TTKClientTagsEnum.T1F01:
        _messageType = TTKMessageType.ASCII;
        _maxLength = null;
        break;
    }

    return (_maxLength, _messageType);
  }
}
