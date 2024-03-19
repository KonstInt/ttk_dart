import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/models/enums/ttk_message_types/ttk_message_types.dart';
import 'package:ttk_payment_terminal/src/data/models/enums/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/service/ascii_converter.dart';

class TTKServiceTagModel {
  final TTKServiceTagsEnum tagName;
  final int? maxLength;

  final TTKMessageType messageType;
  final dynamic message;
  late final int tagSize;
  TTKServiceTagModel(
      {required this.messageType,
      required this.message,
      required this.maxLength,
      required this.tagName}) {
    switch (messageType) {
      case TTKMessageType.ASCII:
        var tmp = AsciiConverter.stringToAsciiArray(message as String);
        if (tmp.length > (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
      case TTKMessageType.ASCII_BCD:
        var tmp = AsciiConverter.stringToAsciiArray(message as String);
        if (tmp.length > (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
      case TTKMessageType.ASCII_HEX:
        var tmp = AsciiConverter.stringToAsciiArray(message as String);
        if (tmp.length > (maxLength ?? double.minPositive.toInt())) {
          throw Exception('Too many characters');
        }
        break;
      case TTKMessageType.BIN:
        // TODO: Handle this case.
        break;
      case TTKMessageType.BCD:
        // TODO: Handle this case.
        break;
    }
  }

  Uint8List getBinary() {
    return Uint8List(10);
  }
}
