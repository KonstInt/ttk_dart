import 'dart:io';
import 'dart:typed_data';

import 'package:ttk_payment_terminal/src/data/logger/logger.dart';

late Socket socket;

Future<Uint8List> readFileByte(String filePath) async {
  final Uri myUri = Uri.parse(filePath);
  final File audioFile = File.fromUri(myUri);
  late Uint8List bytes;
  await audioFile.readAsBytes().then((value) {
    bytes = Uint8List.fromList(value);
    logger.i('reading of bytes is completed');
  }).catchError((onError) {
    logger.e('Exception Error while reading from path:$onError');
  });
  return bytes;
}

Future<void> test() async {
  try {
    socket = await Socket.connect('10.0.0.104', 8888).catchError((e) {
      const int i = 0;
    });
    socket.listen(dataHandler,
        onError: errorHandler, onDone: doneHandler, cancelOnError: false);

    final bytes = Uint8List.fromList([
      0,
      43,
      150,
      242,
      1,
      3,
      80,
      85,
      82,
      2,
      1,
      49,
      3,
      8,
      49,
      51,
      49,
      55,
      51,
      //TODO: 55
      56,
      48,
      48,
      4,
      3,
      49,
      48,
      50,
      95,
      2,
      1,
      0,
      62,
      5,
      54,
      53,
      48,
      48,
      48,
      95,
      10,
      4,
      0,
      36,
      17,
      13
    ]);
    final sendModue = String.fromCharCodes(bytes);

    //socket.write(sendModue);
    socket.add(bytes);
    logger.i('success');
  } catch (e) {
    const int i = 0;
  }
  //Connect standard in to the socket
  //stdin.listen((data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
  //socket.write(new String.fromCharCodes(data).trim() + '\n'));
}

void dataHandler(Uint8List data) {
  final ddd = data;
  final s = data.toString();
  logger.i(s);
}

void errorHandler(error, StackTrace trace) {
  logger.e(error);
}

void doneHandler() {
  socket.destroy();
}

void main() async {
  test();
}

class TLVParser {
  static List<TLV> parse(String tlv) {
    final tlvList = <TLV>[];
    final data = hexToByteArray(tlv);
    getTLVList(data, tlvList);
    return tlvList;
  }

  static void getTLVList(Uint8List data, List<TLV> tlvList) {
    var index = 0;

    while (index < data.length) {
      var isNested = false;

      if ((data[index] & 0x20) == 0x20) {
        isNested = true;
      } else {
        isNested = false;
      }

      Uint8List tag;
      Uint8List length;
      Uint8List value;
      TLV? tlv;

      if ((data[index] & 0x1F) == 0x1F) {
        var lastByte = index + 1;
        while ((data[lastByte] & 0x80) == 0x80) {
          ++lastByte;
        }
        tag = Uint8List.sublistView(data, index, lastByte + 1);
        index += tag.length;
      } else {
        tag = Uint8List(1);
        tag[0] = data[index];
        ++index;

        if (tag[0] == 0x00) {
          break;
        }
      }

      if ((data[index] & 0x80) == 0x80) {
        final n = (data[index] & 0x7F) + 1;
        length = Uint8List.sublistView(data, index, index + n);
        index += length.length;
      } else {
        length = Uint8List(1);
        length[0] = data[index];
        ++index;
      }

      final n = getLengthInt(length);
      value = Uint8List.sublistView(data, index, index + n);
      index += value.length;

      if (isNested) {
        getTLVList(value, tlvList);
      } else {
        tlv = TLV();
        tlv.tag = toHexString(tag);
        tlv.length = toHexString(length);
        tlv.value = toHexString(value);
        tlv.isNested = isNested;
        tlvList.add(tlv);
      }
    }
  }

  static int getLengthInt(Uint8List data) {
    if ((data[0] & 0x80) == 0x80) {
      final n = data[0] & 0x7F;
      var length = 0;
      for (var i = 1; i < n + 1; ++i) {
        length <<= 8;
        length |= data[i] & 0xFF;
      }
      return length;
    } else {
      return data[0] & 0xFF;
    }
  }
}

String toHexString(Uint8List data) {
  return data.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
}

Uint8List hexToByteArray(String hexStr) {
  final result = Uint8List(hexStr.length ~/ 2);
  for (var i = 0; i < hexStr.length ~/ 2; i++) {
    final high = int.parse(hexStr.substring(i * 2, i * 2 + 1), radix: 16);
    final low = int.parse(hexStr.substring(i * 2 + 1, i * 2 + 2), radix: 16);
    result[i] = (high * 16 + low).toUnsigned(8);
  }
  return result;
}

class TLV {
  late String tag;
  late String length;
  late String value;
  late bool isNested;

  @override
  String toString() {
    return 'Tag: $tag, Length: $length, Value: $value, IsNested: $isNested';
  }
}
