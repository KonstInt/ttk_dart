class AsciiConverter {
  ///ASCII to string conversion
  static String asciiArrayToString(List<int> asciiArray) {
    var str = '';
    for (var asciiCode in asciiArray) {
      str += String.fromCharCode(asciiCode);
    }
    return str;
  }

  ///String to ASCII conversion
  static List<int> stringToAsciiArray(String str) {
    var asciiArray = <int>[];
    for (var i = 0; i < str.length; i++) {
      asciiArray.add(str.codeUnitAt(i));
    }
    return asciiArray;
  }
}
