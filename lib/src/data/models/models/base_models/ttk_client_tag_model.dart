import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/helpers/ascii_converter.dart';
import 'package:ttk_payment_terminal/src/data/helpers/bcd_converter.dart';
import 'package:ttk_payment_terminal/src/data/helpers/tag_additional_information_getter.dart';
import 'package:ttk_payment_terminal/src/data/models/enums/tags/ttk_client_tags/ttk_client_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/ttk_message_types/ttk_message_types.dart';

class TTKClientTagModel {
  TTKClientTagModel({required this.message, required this.tagName}) {
    final (tmpMaxLength, tmpMessageType) =
        TagAdditionalInformationGetter.getAdditionalInfoOfClientTags(tagName);
    maxLength = tmpMaxLength;
    messageType = tmpMessageType;
    if (maxLength != null) {
      switch (messageType) {
        case TTKMessageType.ASCII:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          break;
        case TTKMessageType.ASCII_BCD:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          break;
        case TTKMessageType.ASCII_HEX:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          break;
        case TTKMessageType.BIN:
          if (message is! Uint8List) throw Exception('Have to be Uint8List!');
          if ((message as Uint8List).length > maxLength!) {
            throw Exception('Too many characters');
          }
          break;
        case TTKMessageType.BCD:
          if (message is! int) throw Exception('Have to Integer');
          final tmp = BCDConverter.bcdToUint8List(message as int);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          break;
      }
    }
  }

  final TTKClientTagsEnum tagName;
  late final int? maxLength;

  late final TTKMessageType messageType;
  final dynamic message;
  late final int tagSize;
}
