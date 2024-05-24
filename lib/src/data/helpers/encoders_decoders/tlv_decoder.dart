import 'dart:math';
import 'dart:typed_data';

import 'package:pos_payment_terminal/src/data/helpers/converters/hex_converter.dart';
import 'package:pos_payment_terminal/src/data/models/pos/base_models/api_pos_service_tag_model.dart';
import 'package:pos_payment_terminal/src/data/models/pos/enums/tags/pos_service_tags/pos_service_tags_enum.dart';
import 'package:pos_payment_terminal/src/logger/logger.dart';

class BerTlvEncoderDecoder {
  ///Проверка бита
  static bool isBitSet(int i, int j) {
    // Проверяем, установлен ли бит в позиции j в числе i
    return ((i >> j) & 1) == 1;
  }

  static int clearBit(int byte, int bitIndex) {
    // Создаем маску для обнуления нужного бита
    final int mask = ~(1 << bitIndex);
    // Применяем маску к байту, чтобы обнулить нужный бит
    final int result = byte & mask;
    return result;
  }

  static (Map<POSServiceTagsEnum, ApiPOSServiceTagModel>?, int) decoderService(
      Uint8List dataList) {
    final Map<POSServiceTagsEnum, ApiPOSServiceTagModel> messageTags = {};
    int returnLength = 0;
    try {
      final iterator = dataList.iterator;

      if (dataList.isEmpty) {
        return (null, 0);
      } else if (dataList.length > 2) {
        iterator.moveNext();
        var length = _getLengthOfFile(iterator);
        returnLength = length;
        final POSType type = _getTypeFromServerPOSType(iterator);
        if (type == POSType.POS1) {
          throw Exception('POS1 is not supported');
        } else {
          length -= 2;
        }

        while (length > 0) {
          final (
            POSServiceTagsEnum tagType,
            String tagStrName,
            int tmpTagSize
          ) = _getServiceTag(iterator);
          final (int tagSize, int tmpSizeSize) = _getLengthOfTagData(iterator);
          final Uint8List tagData = _getDataWithSize(iterator, tagSize);
          messageTags[tagType] = ApiPOSServiceTagModel.fromBin(
              tagName: tagType, tagStrName: tagStrName, binaryMessage: tagData);
          length -= tmpSizeSize + tmpTagSize + tagSize;
        }
        return (messageTags, returnLength);
      }
    } catch (e) {
      logger.debugPrint(e.toString());
      return (messageTags, returnLength);
    }
    return (messageTags, returnLength);
  }

  static (POSServiceTagsEnum, String, int) _getServiceTag(
      Iterator<int> iterator) {
    bool hasNextTag = false;
    final tagStringBuffer = StringBuffer('T');
    int tagSize = 0;
    do {
      final tmpTag = iterator.current;
      hasNextTag = isBitSet(tmpTag, 0) &&
          isBitSet(tmpTag, 1) &&
          isBitSet(tmpTag, 2) &&
          isBitSet(tmpTag, 3) &&
          isBitSet(tmpTag, 4);
      final hexStrTag = HexConverter.decimalToHex(tmpTag);
      tagStringBuffer.write(hexStrTag.length > 1 ? hexStrTag : '0$hexStrTag');
      tagSize++;
      iterator.moveNext();
    } while (hasNextTag);
    final str = tagStringBuffer.toString();
    return (
      POSServiceTagsEnum.values.firstWhere(
        (element) => element.name == str,
        orElse: () {
          logger.debugPrint(str);
          return POSServiceTagsEnum.TUnknown;
        },
      ),
      str,
      tagSize
    );
  }

  static (int, int) _getLengthOfTagData(Iterator<int> iterator) {
    final int sizeTag1 = iterator.current;
    int lengthSize = 1;
    if (!isBitSet(sizeTag1, 7)) {
      iterator.moveNext();

      return (sizeTag1, lengthSize);
    } else {
      int multiPartDataSize = 0;
      int i = clearBit(sizeTag1, 7);
      iterator.moveNext();
      while (i != 0) {
        final tmpSize = (iterator.current * pow(256, i - 1)).toInt();
        i--;
        multiPartDataSize += tmpSize;
        iterator.moveNext();
        lengthSize++;
      }
      return (multiPartDataSize, lengthSize);
    }
  }

  static Uint8List _getDataWithSize(Iterator<int> iterator, int size) {
    final List<int> list = [];
    for (int i = 0; i < size; i++) {
      list.add(iterator.current);
      iterator.moveNext();
    }

    return Uint8List.fromList(list);
  }

  static int _getLengthOfFile(Iterator<int> iterator) {
    final firstLengthBit = iterator.current * 256;
    iterator.moveNext();
    final secondLengthBit = iterator.current;
    iterator.moveNext();
    return firstLengthBit + secondLengthBit;
  }

  static POSType _getTypeFromServerPOSType(Iterator<int> iterator) {
    final firstTypeBit = HexConverter.decimalToHex(iterator.current);
    iterator.moveNext();
    final secondTypeBit = HexConverter.decimalToHex(iterator.current);
    iterator.moveNext();
    if (firstTypeBit == '97' && secondTypeBit == 'F2') {
      return POSType.POS2;
    } else if (firstTypeBit == '97' && secondTypeBit == 'F3') {
      return POSType.POS2;
    } else {
      return POSType.POS1;
    }
  }
}

enum POSType { POS1, POS2, POS3 }
