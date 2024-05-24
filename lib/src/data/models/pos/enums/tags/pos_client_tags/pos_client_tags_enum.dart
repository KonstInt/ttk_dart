import 'package:pos_payment_terminal/src/data/models/pos/enums/pos_message_types.dart';

enum POSClientTagsEnum {
  /// Message ID | ASCII | 3
  T01(messageType: POSMessageType.ASCII, maxLength: 3),

  /// ECR number | ASCII | 10
  T02(messageType: POSMessageType.ASCII, maxLength: 10),

  /// ERN | ASCII-BCD | 10
  T03(messageType: POSMessageType.ASCII_BCD, maxLength: 10),

  /// Transaction Amount | ASCII-BCD | 12
  T04(messageType: POSMessageType.ASCII_BCD, maxLength: 12),

  /// Transaction Mode | BIN | 00000000
  T08(messageType: POSMessageType.BIN, maxLength: null),

  /// PAN | ASCII | 19
  T09(messageType: POSMessageType.ASCII, maxLength: 19),

  /// Invoice Number | ASCII-BCD | 6
  T0B(messageType: POSMessageType.ASCII_BCD, maxLength: 6),

  /// Authorization ID | ASCII | 6
  T0C(messageType: POSMessageType.ASCII, maxLength: 6),

  /// Order Details | ASCII |
  T0D(messageType: POSMessageType.ASCII, maxLength: null),

  /// Commodity Code | ASCII |
  T0E(messageType: POSMessageType.ASCII, maxLength: null),

  /// Host Id | ASCII |
  T0F(messageType: POSMessageType.ASCII, maxLength: null),

  /// RRN | ASCII-BCD | 12
  T18(messageType: POSMessageType.ASCII_BCD, maxLength: 12),

  /// SRV subfunction | ASCII-HEX | 1
  T1A(messageType: POSMessageType.ASCII_HEX, maxLength: 1),

  /// Currency | ASCII-BCD | 3
  T1B(messageType: POSMessageType.ASCII_BCD, maxLength: 3),

  /// Language | ASCII | 2
  T1C(messageType: POSMessageType.ASCII, maxLength: 2),

  /// Reader command | BIN
  T1D(messageType: POSMessageType.BIN, maxLength: null),

  /// Local Time | BCD | 7
  T1E(messageType: POSMessageType.BCD, maxLength: 7),

  /// Input Code | ASCII-BCD | 1
  T1F00(messageType: POSMessageType.ASCII_BCD, maxLength: 1),

  /// Input Data | ASCII
  T1F01(messageType: POSMessageType.ASCII, maxLength: null),

  //TODO:
  /// PAN | ASCII-BCD | 3
  TA5(messageType: POSMessageType.ASCII_BCD, maxLength: 10),

  /// Input Data | ASCII
  T9F42(messageType: POSMessageType.ASCII, maxLength: null),
  ;

  final POSMessageType messageType;
  final int? maxLength;
  const POSClientTagsEnum({required this.messageType, required this.maxLength});
}
