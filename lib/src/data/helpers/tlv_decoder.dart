// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/helpers/hex_converter.dart';
import 'package:ttk_payment_terminal/src/data/logger/logger.dart';
import 'package:ttk_payment_terminal/src/data/models/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/models/base_models/ttk_service_tag_model.dart';

class BerTlvEncoderDecoder {
////Проверка бита
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

  static (List<TTKServiceTagModel>?, int) decoderService(Uint8List dataList) {
    final List<TTKServiceTagModel> messageTags = [];
    int returnLength = 0;
    try {
      final iterator = dataList.iterator;

      if (dataList.isEmpty) {
        return (null, 0);
      } else if (dataList.length > 2) {
        iterator.moveNext();
        var length = _getLengthOfFile(iterator);
        returnLength = length;
        //final tmpIrerator = iterator;
        final TTKType type = _getTypeFromServerTTKType(iterator);
        if (type == TTKType.TTK1) {
          //TODO: handle this case with remove to prev mean
        } else {
          length -= 2;
        }

        while (length > 0) {
          final (TTKServiceTagsEnum tagType, String tagStrName, int tmpTagSize) =
              _getServiceTag(iterator);
          final (int tagSize, int tmpSizeSize) = _getLengthOfTagData(iterator);
          final Uint8List tagData = _getDataWithSize(iterator, tagSize);
          messageTags.add(TTKServiceTagModel.fromBin(
              tagName: tagType, tagStrName: tagStrName, binaryMessage: tagData));
          length -= tmpSizeSize + tmpTagSize + tagSize;
        }
        return (messageTags, returnLength);
      }
    } catch (e) {
      logger.i(e.toString());
      return (messageTags, returnLength);
    }
    return (messageTags, returnLength);
  }

  static (TTKServiceTagsEnum, String, int) _getServiceTag(Iterator<int> iterator) {
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
      TTKServiceTagsEnum.values.firstWhere(
        (element) => element.name == str,
        orElse: () {
          logger.e(str);
          return TTKServiceTagsEnum.TUnknown;
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
      lengthSize--;
      iterator.moveNext();
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

  static TTKType _getTypeFromServerTTKType(Iterator<int> iterator) {
    final firstTypeBit = HexConverter.decimalToHex(iterator.current);
    iterator.moveNext();
    final secondTypeBit = HexConverter.decimalToHex(iterator.current);
    iterator.moveNext();
    if (firstTypeBit == '97' && secondTypeBit == 'F2') {
      return TTKType.TTK2;
    } else if (firstTypeBit == '97' && secondTypeBit == 'F3') {
      return TTKType.TTK2;
    } else {
      return TTKType.TTK1;
    }
  }
}

enum TTKType { TTK1, TTK2, TTK3 }
