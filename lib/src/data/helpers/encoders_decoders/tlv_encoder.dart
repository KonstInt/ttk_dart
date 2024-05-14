import 'dart:typed_data';

import 'package:pos_payment_terminal/src/data/helpers/converters/ascii_converter.dart';
import 'package:pos_payment_terminal/src/data/helpers/converters/bcd_converter.dart';
import 'package:pos_payment_terminal/src/data/helpers/converters/hex_converter.dart';
import 'package:pos_payment_terminal/src/data/models/pos/base_models/api_pos_client_tag_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_client_tags/pos_client_tags_enum.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/pos_message_types.dart';
import 'package:pos_payment_terminal/src/logger/logger.dart';

class BerTlvEncoderEncoder {
////Проверка бита
  static bool isBitSet(int i, int j) {
    // Проверяем, установлен ли бит в позиции j в числе i
    return ((i >> j - 1) & 1) == 1;
  }

  static int setBit(int byte, int bitIndex) {
    final int mask = 1 << bitIndex - 1;
    final int result = byte | mask;
    return result;
  }

  static Uint8List? encoderClient(
      Map<POSClientTagsEnum, ApiPOSClientTagModel> clientList) {
    try {
      final List<int> result = [0, 0, 0, 0];
      int length = 4;
      for (final client in clientList.entries) {
        final (tag, tagLength) = getServiceTag(client.value.tagName);
        final (data, dataLength) =
            getDataWithSize(client.value.message, client.value.messageType);
        final (size, lengthSize) = getDataLength(dataLength);
        result
          ..addAll(tag)
          ..addAll(size)
          ..addAll(data);
        length += tagLength + dataLength + lengthSize;
      }
      final List<int> header = getPOSHeader(POSType.POS2, length - 2);
      for (int i = 0; i < 4; i++) {
        result[i] = header[i];
      }
      return Uint8List.fromList(result);
    } catch (e) {
      logger.i(e.toString());
      return null;
    }
  }

  static (List<int>, int) getServiceTag(POSClientTagsEnum clientTagEnum) {
    final clientTag = clientTagEnum.name.substring(1);
    final List<int> res = [];
    for (int i = 0; i < clientTag.length; i += 2) {
      res.add(HexConverter.hexToDecimal(clientTag[i] + clientTag[i + 1]));
    }
    return (res, res.length);
  }

  static (List<int>, int) getDataWithSize(message, POSMessageType type) {
    final List<int> list = [];
    switch (type) {
      case POSMessageType.ASCII:
        final tmp = message as String;
        list.addAll(AsciiConverter.stringToAsciiArray(tmp));
        break;
      case POSMessageType.ASCII_BCD:
        final tmp = message as String;
        list.addAll(AsciiConverter.stringToAsciiArray(tmp.toString()));
        break;
      case POSMessageType.ASCII_HEX:
        final tmp = message as String;
        list.addAll(AsciiConverter.stringToAsciiArray(tmp));
        break;
      case POSMessageType.BIN:
        final tmp = message as Uint8List;
        list.addAll(tmp);
        break;
      case POSMessageType.BCD:
        final tmp = message as int;
        list.addAll(BCDConverter.bcdToUint8List(tmp));
        break;
    }

    return (list, list.length);
  }

  static (List<int>, int) getDataLength(int size) {
    final List<int> res = [];
    int localSize = size;
    if (size < 128) {
      return ([size], 1);
    } else {
      while (localSize > 127) {
        res.add(setBit(localSize % 128, 8));
        localSize = localSize ~/ 128;
      }
    }
    return (res.reversed.toList(), res.length);
  }

  static List<int> getPOSHeader(POSType posType, int size) {
    final List<int> dataSize = [size ~/ 256, size % 256];
    switch (posType) {
      case POSType.POS1:
        return dataSize;
      case POSType.POS2:
        return dataSize +
            <int>[
              HexConverter.hexToDecimal('96'),
              HexConverter.hexToDecimal('F2')
            ];
      case POSType.POS3:
        return dataSize +
            <int>[
              HexConverter.hexToDecimal('96'),
              HexConverter.hexToDecimal('F3')
            ];
    }
  }
}

enum POSType { POS1, POS2, POS3 }
