import 'dart:typed_data';

class AsciiConverter {
  ///ASCII <Unit8List> to string conversion
  static String asciiArrayToString(Uint8List asciiArray) {
    return String.fromCharCodes(asciiArray);
  }

  ///String to Unit8List <ASCII> conversion
  static Uint8List stringToAsciiArray(String str) {
    final asciiArray = <int>[];
    for (var i = 0; i < str.length; i++) {
      asciiArray.add(str.codeUnitAt(i));
    }
    return Uint8List.fromList(asciiArray);
  }
}
