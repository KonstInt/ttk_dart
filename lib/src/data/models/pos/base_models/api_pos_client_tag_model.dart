import 'dart:typed_data';

import 'package:pos_payment_terminal/src/data/helpers/converters/ascii_converter.dart';
import 'package:pos_payment_terminal/src/data/helpers/converters/bcd_converter.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_client_tags/pos_client_tags_enum.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/pos_message_types.dart';

class ApiPOSClientTagModel {
  ApiPOSClientTagModel({
    required this.message,
    required this.tagName,
  }) {
    // final (tmpMaxLength, tmpMessageType) =
    //     TagAdditionalInformationGetter.getAdditionalInfoOfClientTags(tagName);
    maxLength = tagName.maxLength;
    messageType = tagName.messageType;
    if (maxLength != null) {
      switch (messageType) {
        case POSMessageType.ASCII:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          tagSize = tmp.length;
          break;
        case POSMessageType.ASCII_BCD:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          tagSize = tmp.length;
          break;
        case POSMessageType.ASCII_HEX:
          if (message is! String) throw Exception('Have to be String!');
          final tmp = AsciiConverter.stringToAsciiArray(message as String);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          tagSize = tmp.length;
          break;
        case POSMessageType.BIN:
          if (message is! Uint8List) throw Exception('Have to be Uint8List!');
          if ((message as Uint8List).length > maxLength!) {
            throw Exception('Too many characters');
          }
          tagSize = (message as Uint8List).length;
          break;
        case POSMessageType.BCD:
          if (message is! int) throw Exception('Have to Integer');
          final tmp = BCDConverter.bcdToUint8List(message as int);
          if (tmp.length > maxLength!) {
            throw Exception('Too many characters');
          }
          tagSize = tmp.length;
          break;
      }
    }
  }

  final POSClientTagsEnum tagName;

  late final int? maxLength;

  late final POSMessageType messageType;
  final dynamic message;
  late final int tagSize;
}
