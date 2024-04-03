// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/models/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/service/hex_converter.dart';

class BerTlvEncoderDecoder {
////Проверка бита
  static bool isBitSet(int i, int j) {
    // Проверяем, установлен ли бит в позиции j в числе i
    return ((i >> j) & 1) == 1;
  }

  static int clearBit(int byte, int bitIndex) {
    // Создаем маску для обнуления нужного бита
    int mask = ~(1 << bitIndex);
    // Применяем маску к байту, чтобы обнулить нужный бит
    int result = byte & mask;
    return result;
  }

  static dynamic decoder(Uint8List dataList) {
    final iterator = dataList.iterator;

    if (dataList.isEmpty) {
      return null;
    } else if (dataList.length > 2) {
      iterator.moveNext();
      var length = getLengthOfFile(iterator);
      //final tmpIrerator = iterator;
      final TTKType type = getTypeFromServerTTKType(iterator);
      if (type == TTKType.TTK1) {
        //TODO: handle this case with remove to prev mean
      } else {
        length -= 2;
      }
      for (int i = 0; i < length; i++) {}
    }
  }

  static TTKServiceTagsEnum getServiceTag(Iterator<int> iterator) {
    bool hasNextTag = false;
    final tagStringBuffer = StringBuffer('T');
    do {
      final tmpTag = iterator.current;
      hasNextTag = isBitSet(tmpTag, 0) &&
          isBitSet(tmpTag, 1) &&
          isBitSet(tmpTag, 2) &&
          isBitSet(tmpTag, 3) &&
          isBitSet(tmpTag, 4);
      tagStringBuffer.write(HexConverter.decimalToHex(tmpTag));
      iterator.moveNext();
    } while (hasNextTag);
    final str = tagStringBuffer.toString();
    return TTKServiceTagsEnum.values
        .firstWhere((element) => element.name == str);
  }

  static int getLengthOfTagData(Iterator<int> iterator) {
    final int sizeTag1 = iterator.current;
    if (!isBitSet(sizeTag1, 8)) {
      return sizeTag1;
    } else {
      int multiPartDataSize = 0;
      int i = clearBit(sizeTag1, 8);
      do {
        final tmpSize = iterator.current.modPow(256, i - 1);
        i--;
        multiPartDataSize += tmpSize;
        iterator.moveNext();
      } while (i != 0);
      return multiPartDataSize;
    }
  }

  static Uint8List getDataWithSize(Iterator<int> iterator, int size) {
    Uint8List list =Uint8List(size);
    for (int i = 0; i < size; i++) {
      list.add(iterator.current);
      iterator.moveNext();
    }
    return list;
  }

  static int getLengthOfFile(Iterator<int> iterator) {
    final firstLengthBit = iterator.current * 256;
    iterator.moveNext();
    final secondLengthBit = iterator.current;
    iterator.moveNext();
    return firstLengthBit + secondLengthBit;
  }

  static TTKType getTypeFromServerTTKType(Iterator<int> iterator) {
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
/*  static List<int> encode(int tag, List<int> data) {
    List<int> encoded = [];
    // Encode tag
    if (tag < 0x1F) {
      encoded.add(tag);
    } else {
      List<int> tagBytes = [];
      while (tag > 0) {
        tagBytes.add(tag & 0x7F);
        tag >>= 7;
      }
      tagBytes[tagBytes.length - 1] |= 0x80; // Set MSB of last byte
      encoded.addAll(tagBytes.reversed);
    }
    // Encode length
    if (data.length < 0x80) {
      encoded.add(data.length);
    } else if (data.length < 0x100) {
      encoded.addAll([0x81, data.length]);
    } else {
      encoded.addAll([0x82, (data.length >> 8) & 0xFF, data.length & 0xFF]);
    }
    // Encode data
    encoded.addAll(data);
    return encoded;
  }

  static Map<String, dynamic> decode(List<int> encoded) {
    int tag = 0;
    int length = 0;
    int dataStartIndex = 0;

    // Decode tag
    int index = 0;
    while ((encoded[index] & 0x80) != 0) {
      tag = (tag << 7) | (encoded[index] & 0x7F);
      index++;
    }
    tag = (tag << 7) | encoded[index];
    index++;

    // Decode length
    if ((encoded[index] & 0x80) == 0) {
      length = encoded[index];
      index++;
    } else {
      int lengthBytes = encoded[index] & 0x7F;
      for (int i = 0; i < lengthBytes; i++) {
        length = (length << 8) | encoded[index + 1 + i];
      }
      index += lengthBytes + 1;
    }
    dataStartIndex = index;

    // Extract data
    List<int> data = encoded.sublist(dataStartIndex, dataStartIndex + length);

    return {'tag': tag, 'length': length, 'data': data};
  }*/