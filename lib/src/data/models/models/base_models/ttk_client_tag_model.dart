import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/models/enums/tags/ttk_client_tags/ttk_client_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/enums/ttk_message_types/ttk_message_types.dart';
import 'package:ttk_payment_terminal/src/data/service/ascii_converter.dart';
import 'package:ttk_payment_terminal/src/data/service/bcd_converter.dart';

class TTKClientTagModel {

  TTKClientTagModel(
      {required this.messageType,
      required this.message,
      required this.maxLength,
      required this.tagName}) {
    switch (messageType) {
      case TTKMessageType.ASCII:
        final tmp = AsciiConverter.stringToAsciiArray(message as String);
        if (tmp.length > (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
      case TTKMessageType.ASCII_BCD:
        final tmp = AsciiConverter.stringToAsciiArray(message as String);
        if (tmp.length > (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
      case TTKMessageType.ASCII_HEX:
        final tmp = AsciiConverter.stringToAsciiArray(message as String);
        if (tmp.length > (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
      case TTKMessageType.BIN:
        if ((message as Uint8List).length >
            (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
      case TTKMessageType.BCD:
        final tmp = BCDConverter.bcdToUint8List(message as int);
        if (tmp.length > (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
    }
  }
  final TTKClientTagsEnum tagName;
  final int? maxLength;
  final TTKMessageType messageType;
  final dynamic message;
  late final int tagSize;
}
