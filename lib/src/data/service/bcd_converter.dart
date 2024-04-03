import 'dart:typed_data';

class BCDConverter {
  ///BCD to Unit8List
  static Uint8List bcdToUint8List(int bcd) {
    final bytes = <int>[];
    while (bcd > 0) {
      final digit = bcd % 10;
      bcd ~/= 10;
      final nextDigit = bcd % 10;
      bcd ~/= 10;
      bytes.insert(0, (nextDigit << 4) + digit);
    }
    return Uint8List.fromList(bytes);
  }

  /// Unit8List to BCD
  static int uint8ListToBCD(Uint8List bytes) {
    var bcd = 0;
    for (final byte in bytes) {
      final lowerDigit = byte & 0xF;
      final upperDigit = (byte >> 4) & 0xF;
      bcd = (bcd * 100) + (upperDigit * 10) + lowerDigit;
    }
    return bcd;
  }
}
