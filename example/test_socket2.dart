import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:ttk_payment_terminal/logger/logger.dart';
import 'package:ttk_payment_terminal/src/data/helpers/encoders_decoders/tlv_decoder.dart';
import 'package:ttk_payment_terminal/src/data/helpers/encoders_decoders/tlv_encoder.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_client_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/base_models/api_ttk_service_tag_model.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/tags/ttk_client_tags/ttk_client_tags_enum.dart';
import 'package:ttk_payment_terminal/src/data/models/ttk/enums/tags/ttk_service_tags/ttk_service_tags_enum.dart';

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

    final List<ApiTTKClientTagModel> client = [
      ApiTTKClientTagModel(message: 'PUR', tagName: TTKClientTagsEnum.T01),
      ApiTTKClientTagModel(message: '5', tagName: TTKClientTagsEnum.T02),
      ApiTTKClientTagModel(message: '66558906', tagName: TTKClientTagsEnum.T03),
      ApiTTKClientTagModel(message: '150', tagName: TTKClientTagsEnum.T04),
      // TTKClientTagModel(
      //     message: Uint8List.fromList([128]), tagName: TTKClientTagsEnum.T08)

      // Сверка итогов
      // ApiTTKClientTagModel(message: 'SRV', tagName: TTKClientTagsEnum.T01),
      // ApiTTKClientTagModel(message: '9', tagName: TTKClientTagsEnum.T02),
      // ApiTTKClientTagModel(message: '66558909', tagName: TTKClientTagsEnum.T03),
      // // TTKClientTagModel(message: '10000000', tagName: TTKClientTagsEnum.T04),
      // ApiTTKClientTagModel(message: '2', tagName: TTKClientTagsEnum.T1A),
      // //  TTKClientTagModel(message: '2С01000101 ', tagName: TTKClientTagsEnum.T1D),
      // // TTKClientTagModel(
      // //     message: Uint8List.fromList([128]), tagName: TTKClientTagsEnum.T08)
    ];
    final bytes = BerTlvEncoderEncoder.encoderClient(client);
    logger.t(bytes);

    //socket.write(sendModue);
    socket.add(bytes ?? []);

    logger.i('success');
  } catch (e) {
    const int i = 0;
  }
  //Connect standard in to the socket
  //stdin.listen((data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
  //socket.write(new String.fromCharCodes(data).trim() + '\n'));
}

void dataHandler(Uint8List data) {
  var ddd = data;
  //final s = data.toString();
  writeToFile(data);
  var dLength = data.length;
  final List<Map<TTKServiceTagsEnum, ApiTTKServiceTagModel>> tags = [];
  while (dLength != 0) {
    final (tmp, length) = BerTlvEncoderDecoder.decoderService(ddd);
    if (tmp != null) tags.add(tmp);
    dLength -= length + 2;
    if (dLength >= 0) {
      ddd = ddd.sublist(length + 2);
    }

    logger.log(Level.debug, tmp);
  }
  bool hasAFlag = false;
  for (final tmp in tags) {
    if (tmp.containsKey(TTKServiceTagsEnum.TA1)) {
      if (tmp[TTKServiceTagsEnum.TA1]!.message as String == 'Y') {
        hasAFlag = true;
      }
      hasAFlag = false;
    }
  }

  logger.i(tags);
}

Future<void> writeToFile(Uint8List data) async {
  final File file = File('test.txt');
  file.writeAsStringSync(data.toList().toString());
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
