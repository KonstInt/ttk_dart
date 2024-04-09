import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/models/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/helpers/ascii_converter.dart';
import 'package:ttk_payment_terminal/src/data/helpers/bcd_converter.dart';
import 'package:ttk_payment_terminal/src/data/helpers/tag_additional_information_getter.dart';
import 'package:ttk_payment_terminal/src/data/ttk_message_types/ttk_message_types.dart';

class TTKServiceTagModel {
  TTKServiceTagModel({required this.message, required this.tagName}) {
    final (tmpMaxLength, tmpMessageType) =
        TagAdditionalInformationGetter.getAdditionalInfoOfServiceTags(tagName);
    maxLength = tmpMaxLength;
    messageType = tmpMessageType;
    if (maxLength != null) {
      switch (messageType) {
        case TTKMessageType.ASCII:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }
          break;
        case TTKMessageType.ASCII_BCD:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }
          break;
        case TTKMessageType.ASCII_HEX:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }
          break;
        case TTKMessageType.BIN:
          if (message is! Uint8List) throw Exception('Have to be Uint8List!');
          if ((message as Uint8List).length > maxLength!) {
            throw Exception('Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${(message as Uint8List).length}');
          }
          break;
        case TTKMessageType.BCD:
          if (message is! int) throw Exception('Have to Integer');
          final tmp = BCDConverter.bcdToUint8List(message as int);
          if (tmp.length > maxLength!) {
              throw Exception('Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }
          break;
      }
    }
  }

  factory TTKServiceTagModel.fromBin({
    required TTKServiceTagsEnum tagName,
    required Uint8List binaryMessage,
  }) {
    final dynamic message;
    final (_, tmpMessageType) =
        TagAdditionalInformationGetter.getAdditionalInfoOfServiceTags(tagName);
    switch (tmpMessageType) {
      case TTKMessageType.ASCII:
        message = AsciiConverter.asciiArrayToString(binaryMessage);
        break;
      case TTKMessageType.ASCII_BCD:
        message = AsciiConverter.asciiArrayToString(binaryMessage);
        break;
      case TTKMessageType.ASCII_HEX:
        message = AsciiConverter.asciiArrayToString(binaryMessage);
        break;
      case TTKMessageType.BIN:
        message = binaryMessage;
        break;
      case TTKMessageType.BCD:
        message = BCDConverter.uint8ListToBCD(binaryMessage);
        break;
    }
    return TTKServiceTagModel(
      message: message,
      tagName: tagName,
    );
  }

  final TTKServiceTagsEnum tagName;
  late final int? maxLength;

  late final TTKMessageType messageType;
  final dynamic message;
  late final int tagSize;
}
