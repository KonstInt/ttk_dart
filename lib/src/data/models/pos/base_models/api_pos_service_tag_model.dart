import 'dart:typed_data';

import 'package:pos_payment_terminal/src/data/helpers/converters/ascii_converter.dart';
import 'package:pos_payment_terminal/src/data/helpers/converters/bcd_converter.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_service_tags/pos_service_tags_enum.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/pos_message_types.dart';

class ApiPOSServiceTagModel {
  ApiPOSServiceTagModel(
      {required this.message,
      required this.tagName,
      required this.tagStrName}) {
    // final (tmpMaxLength, tmpMessageType) =
    //     TagAdditionalInformationGetter.getAdditionalInfoOfServiceTags(tagName);
    maxLength = tagName.maxLength;
    messageType = tagName.messageType;
    if (maxLength != null) {
      switch (messageType) {
        case POSMessageType.ASCII:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          tagSize = tmp.length;
          if (tmp.length > maxLength!) {
            throw Exception(
                'Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }

          break;
        case POSMessageType.ASCII_BCD:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          tagSize = tmp.length;
          if (tmp.length > maxLength!) {
            throw Exception(
                'Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }

          break;
        case POSMessageType.ASCII_HEX:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          tagSize = tmp.length;
          if (tmp.length > maxLength!) {
            throw Exception(
                'Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }
          break;
        case POSMessageType.BIN:
          if (message is! Uint8List) throw Exception('Have to be Uint8List!');
          tagSize = (message as Uint8List).length;
          if ((message as Uint8List).length > maxLength!) {
            throw Exception(
                'Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${(message as Uint8List).length}');
          }
          break;
        case POSMessageType.BCD:
          if (message is! int) throw Exception('Have to Integer');

          final tmp = BCDConverter.bcdToUint8List(message as int);
          tagSize = tmp.length;
          if (tmp.length > maxLength!) {
            throw Exception(
                'Too many characters tag $tagName\n maxSize: $maxLength\n currentLength: ${tmp.length}');
          }

          break;
      }
    }
  }

  factory ApiPOSServiceTagModel.fromBin({
    required POSServiceTagsEnum tagName,
    required Uint8List binaryMessage,
    required String tagStrName,
  }) {
    final dynamic message;
    // final (_, tmpMessageType) =
    //     TagAdditionalInformationGetter.getAdditionalInfoOfServiceTags(tagName);
    switch (tagName.messageType) {
      case POSMessageType.ASCII:
        message = AsciiConverter.asciiArrayToString(binaryMessage);
        break;
      case POSMessageType.ASCII_BCD:
        message = AsciiConverter.asciiArrayToString(binaryMessage);
        break;
      case POSMessageType.ASCII_HEX:
        message = AsciiConverter.asciiArrayToString(binaryMessage);
        break;
      case POSMessageType.BIN:
        message = binaryMessage;
        break;
      case POSMessageType.BCD:
        message = BCDConverter.uint8ListToBCD(binaryMessage);
        break;
    }
    return ApiPOSServiceTagModel(
      message: message,
      tagName: tagName,
      tagStrName: tagStrName,
    );
  }

  final POSServiceTagsEnum tagName;
  late final int? maxLength;

  final String tagStrName;

  late final POSMessageType messageType;
  final dynamic message;
  late final int tagSize;
}
