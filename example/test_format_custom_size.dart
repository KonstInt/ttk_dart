import 'dart:math';

import 'package:ttk_payment_terminal/src/data/logger/logger.dart';

void main() {
  final List<int> fsa = [130, 4, 48];
  logger.i(_getLengthOfTagData(fsa.iterator..moveNext()));
}

bool isBitSet(int i, int j) {
  // Проверяем, установлен ли бит в позиции j в числе i
  return ((i >> j - 1) & 1) == 1;
}

int clearBit(int byte, int bitIndex) {
  // Создаем маску для обнуления нужного бита
  final int mask = ~(1 << bitIndex - 1);
  // Применяем маску к байту, чтобы обнулить нужный бит
  final int result = byte & mask;
  return result;
}

(int, int) _getLengthOfTagData(Iterator<int> iterator) {
  final int sizeTag1 = iterator.current;
  int lengthSize = 1;
  if (!isBitSet(sizeTag1, 8)) {
    iterator.moveNext();

    return (sizeTag1, lengthSize);
  } else {
    int multiPartDataSize = 0;
    int i = clearBit(sizeTag1, 8);
    iterator.moveNext();
    while (i != 0) {
      final tmpSize = (iterator.current * pow(256, i - 1)).toInt();
      i--;
      multiPartDataSize += tmpSize;
      iterator.moveNext();
      lengthSize++;
    }
    iterator.moveNext();
    return (multiPartDataSize, lengthSize);
  }
}
