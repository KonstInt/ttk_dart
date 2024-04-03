import 'dart:typed_data';


// class TLV {

//   TLV(this.tag, this.length, this.value);
//   final Tag tag;
//   final int length;
//   final Uint8List value;

//   Uint8List getTagBytes() {
//     int len = 1;
//     final int tagId = tag.getTag();
//     Uint8List result;

//     if (tagId > 0xFFFFFF) {
//       len = 4;
//     } else if (tagId > 0xFFFF) {
//       len = 3;
//     } else if (tagId > 0xFF) {
//       len = 2;
//     }

//     result = Uint8List(len);
//     for (int i = 0; i < len; ++i) {
//       result[i] = (tagId >> (8 * (len - i - 1))) & 0xFF;
//     }

//     return result;
//   }

//   Uint8List getLengthBytes() {
//     int len = 1;
//     Uint8List result;

//     if (length > 0xFFFF) {
//       len = 4;
//     } else if (length > 0xFF) {
//       len = 3;
//     } else if (length > 0x7F) {
//       len = 2;
//     }

//     result = Uint8List(len);
//     switch (len) {
//       case 1:
//         result[0] = length;
//         break;
//       case 2:
//       case 3:
//       case 4:
//         result[0] = 0x80 | (len - 1);
//         for (int i = 0; i < len - 1; ++i) {
//           result[i + 1] = (length >> 8 * (len - i - 2)) & 0xFF;
//         }
//         break;
//     }

//     return result;
//   }

//   static int parseTagId(Uint8List tagBytes) {
//     int len = 1;

//     if ((tagBytes[0] & 0x1F) == 0x1F) {
//       ++len;
//       if ((tagBytes[1] & 0x80) == 0x80) {
//         ++len;
//         if ((tagBytes[2] & 0x80) == 0x80) {
//           ++len;
//         }
//       }
//     }
//     return len;
//   }

//   static int getTagId(Uint8List tagBytes, int len) {
//     int tagId = tagBytes[0] & 0xFF;

//     for (int i = 1; i < len; ++i) {
//       tagId <<= 8;
//       tagId |= (tagBytes[i] & 0xFF);
//     }
//     return tagId;
//   }

//   static int parseTagLen(Uint8List lenBytes) {
//     int len = 1;

//     if ((lenBytes[0] & 0x80) == 0x80) {
//       len = (lenBytes[0] & 0x0F) + 1;
//     }
//     return len;
//   }

//   static int getTagLen(Uint8List lenBytes, int len) {
//     int result = lenBytes[0];
//     switch (len) {
//       case 2:
//       case 3:
//       case 4:
//         result = lenBytes[1];
//         for (int i = 2; i < len; ++i) {
//           result <<= 8;
//           result |= (lenBytes[i] & 0xFF);
//         }
//         break;
//     }
//     return result;
//   }

//   static List<TLV> parseBinaryBuffer(Uint8List data) {
//     List<TLV> listTlv = [];

//     int currPos = 0;
//     while (currPos < data.length) {
//       Uint8List buf = Uint8List(4);
//       buf.setAll(0, data.sublist(currPos, currPos + 4));
//       int tagIdLen = parseTagId(buf);
//       int tagId = getTagId(buf, tagIdLen);
//       currPos += tagIdLen;

//       buf = Uint8List(4);
//       buf.setAll(0, data.sublist(currPos, currPos + 4));
//       int tagLenLen = parseTagLen(buf);
//       int tagLen = getTagLen(buf, tagLenLen);
//       currPos += tagLenLen;

//       buf = Uint8List(tagLen);
//       buf.setAll(0, data.sublist(currPos, currPos + tagLen));
//       currPos += tagLen;

//       TLV tlv = TLV(Tag.getTag(tagId), tagLen, buf);
//       listTlv.add(tlv);
//     }
//     return listTlv;
//   }

//   Uint8List getFullTLV() {
//     final Uint8List tagBytes = getTagBytes();
//     final Uint8List lengthBytes = getLengthBytes();
//     final Uint8List result = Uint8List(tagBytes.length + lengthBytes.length + value.length);

//     result.setAll(0, tagBytes);
//     result.setAll(tagBytes.length, lengthBytes);
//     result.setAll(tagBytes.length + lengthBytes.length, value);

//     return result;
//   }
// }
