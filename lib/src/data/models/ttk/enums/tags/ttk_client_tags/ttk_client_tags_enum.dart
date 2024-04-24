import 'package:ttk_payment_terminal/src/data/models/ttk/enums/ttk_message_types.dart';

enum TTKClientTagsEnum {
  /// Message ID | ASCII | 3
  T01(messageType: TTKMessageType.ASCII, maxLength: 3),

  /// ECR number | ASCII | 10
  T02(messageType: TTKMessageType.ASCII, maxLength: 10),

  /// ERN | ASCII-BCD | 10
  T03(messageType: TTKMessageType.ASCII_BCD, maxLength: 10),

  /// Transaction Amount | ASCII-BCD | 12
  T04(messageType: TTKMessageType.ASCII_BCD, maxLength: 12),

  /// Transaction Mode | BIN | 00000000
  T08(messageType: TTKMessageType.BIN, maxLength: null),

  /// PAN | ASCII | 19
  T09(messageType: TTKMessageType.ASCII, maxLength: 19),

  /// Invoice Number | ASCII-BCD | 6
  T0B(messageType: TTKMessageType.ASCII_BCD, maxLength: 6),

  /// Authorization ID | ASCII | 6
  T0C(messageType: TTKMessageType.ASCII, maxLength: 6),

  /// Order Details | ASCII |
  T0D(messageType: TTKMessageType.ASCII, maxLength: null),

  /// Commodity Code | ASCII |
  T0E(messageType: TTKMessageType.ASCII, maxLength: null),

  /// RRN | ASCII-BCD | 12
  T18(messageType: TTKMessageType.ASCII_BCD, maxLength: 12),

  /// SRV subfunction | ASCII-HEX | 1
  T1A(messageType: TTKMessageType.ASCII_HEX, maxLength: 1),

  /// Currency | ASCII-BCD | 3
  T1B(messageType: TTKMessageType.ASCII_BCD, maxLength: 3),

  /// Language | ASCII | 2
  T1C(messageType: TTKMessageType.ASCII, maxLength: 2),

  /// Reader command | BIN
  T1D(messageType: TTKMessageType.BIN, maxLength: null),

  /// Local Time | BCD | 7
  T1E(messageType: TTKMessageType.BCD, maxLength: 7),

  /// Input Code | ASCII-BCD | 1
  T1F00(messageType: TTKMessageType.ASCII_BCD, maxLength: 1),

  /// Input Data | ASCII
  T1F01(messageType: TTKMessageType.ASCII, maxLength: null),
  ;

  final TTKMessageType messageType;
  final int? maxLength;
  const TTKClientTagsEnum({required this.messageType, required this.maxLength});
}
