class HexConverter {
  ///Hex to Decimal conversion
  static int hexToDecimal(String hex) {
    return int.parse(hex, radix: 16);
  }

  ///Decimal  to Hex conversion
  static String decimalToHex(int decimal) {
    return decimal.toRadixString(16).toUpperCase();
  }
}
