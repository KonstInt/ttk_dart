import 'package:pos_payment_terminal/src/data/models/pos/enums/pos_message_types.dart';

enum POSServiceTagsEnum {
  /// Response error message | ASCII | 8
  T5F05(messageType: POSMessageType.ASCII, maxLength: 8),

  /// Message ID | ASCII | 3
  T81(messageType: POSMessageType.ASCII, maxLength: 3),

  /// ECR number | ASCII | 10
  T82(messageType: POSMessageType.ASCII, maxLength: 10),

  /// ERN | ASCII-BCD | 10
  T83(messageType: POSMessageType.ASCII_BCD, maxLength: 10),

  /// Response Code | ASCII | 3
  T9B(messageType: POSMessageType.ASCII, maxLength: 3),

  /// Transaction Amount | ASCII-BCD | 12
  T84(messageType: POSMessageType.ASCII_BCD, maxLength: 12),

  /// PAN | ASCII | 19
  T89(messageType: POSMessageType.ASCII, maxLength: 19),

  /// Invoice Number | ASCII-BCD | 6
  T8B(messageType: POSMessageType.ASCII_BCD, maxLength: 6),

  /// Authorization ID | ASCII | 6
  T8C(messageType: POSMessageType.ASCII, maxLength: 6),

  /// Date | ASCII-BCD | 8
  T8D(messageType: POSMessageType.ASCII_BCD, maxLength: 8),

  /// Time | ASCII-BCD | 6
  T8E(messageType: POSMessageType.ASCII_BCD, maxLength: 6),

  /// Issuer Name | ASCII | 18
  T8F(messageType: POSMessageType.ASCII, maxLength: 18),

  /// Merchant No | ASCII | 15
  T90(messageType: POSMessageType.ASCII, maxLength: 15),

  /// POS Entry Mode | ASCII-HEX | 3
  T92(messageType: POSMessageType.ASCII_HEX, maxLength: 3),

  /// POS Condition Code | ASCII-HEX | 2
  T93(messageType: POSMessageType.ASCII_HEX, maxLength: 2),

  /// Cardholder Verification Method | ASCII | 1
  T94(messageType: POSMessageType.ASCII, maxLength: 1),

  /// TVR | BIN | 5
  T95(messageType: POSMessageType.BIN, maxLength: 5),

  /// RRN | ASCII-BCD | 12
  T98(messageType: POSMessageType.ASCII_BCD, maxLength: 12),

  /// Batch No | ASCII-BCD | 6
  T99(messageType: POSMessageType.ASCII_BCD, maxLength: 6),

  /// Operation Receipt | ASCII |
  T9C(messageType: POSMessageType.ASCII, maxLength: null),

  /// Terminal ID | ASCII | 8
  T9D(messageType: POSMessageType.ASCII, maxLength: 8),

  /// Receipt PDS | BIN
  T9E(messageType: POSMessageType.BIN, maxLength: null),

  /// Receipt Second PDS | BIN
  T9F0E(messageType: POSMessageType.BIN, maxLength: null),

  /// Application ID | BIN | 8
  T9F06(messageType: POSMessageType.BIN, maxLength: 8),

  /// TC | BIN | 8
  T9F26(messageType: POSMessageType.BIN, maxLength: 8),

  /// Visual Host Response | ASCII | 41
  TA0(messageType: POSMessageType.ASCII, maxLength: 41),

  /// Approve | ASCII | 1
  TA1(messageType: POSMessageType.ASCII, maxLength: 1),

  /// Transaction Amount #2 | ASCII-BCD | 12
  TA2(messageType: POSMessageType.ASCII_BCD, maxLength: 12),

  /// Application Label | ASCII | 16
  T50(messageType: POSMessageType.ASCII, maxLength: 16),

  /// Currency | ASCII | 3
  TC1(messageType: POSMessageType.ASCII, maxLength: 3),

  /// Decimal Point | ASCII-BCD | 1
  TC2(messageType: POSMessageType.ASCII_BCD, maxLength: 1),

  /// Reader command result | BIN
  TCD(messageType: POSMessageType.BIN, maxLength: null),

  /// Local time | BCD | 7
  TCE(messageType: POSMessageType.BCD, maxLength: 7),

  /// Status ID | ASCII-BCD | 3
  T1F70(messageType: POSMessageType.ASCII_BCD, maxLength: 3),

  /// Status Text | ASCII
  T1F71(messageType: POSMessageType.ASCII, maxLength: null),

  /// Input Template ID | ASCII-BCD | 3
  T1F72(messageType: POSMessageType.ASCII_BCD, maxLength: 3),

  /// Input Min Length | ASCII-BCD | 2
  T1F73(messageType: POSMessageType.ASCII_BCD, maxLength: 2),

  /// Input Max Length | ASCII-BCD | 2
  T1F74(messageType: POSMessageType.ASCII_BCD, maxLength: 2),

  /// Input Format | ASCII-BCD | 1
  T1F75(messageType: POSMessageType.ASCII_BCD, maxLength: 1),

  /// Input Caption | ASCII
  T1F76(messageType: POSMessageType.ASCII, maxLength: null),

  /// Input Text | ASCII
  T1F77(messageType: POSMessageType.ASCII, maxLength: null),

  /// Input Default Value | ASCII
  T1F78(messageType: POSMessageType.ASCII, maxLength: null),

  /// Input Currency | ASCII | 3
  T1F79(messageType: POSMessageType.ASCII, maxLength: 3),

  /// Input Decimal Point | ASCII-BCD | 1
  T1F7A(messageType: POSMessageType.ASCII_BCD, maxLength: 1),

  /// Input Items | ASCII
  T1F7B(messageType: POSMessageType.ASCII, maxLength: null),

  /// Timeout | ASCII-BCD | 6
  T1F7C(messageType: POSMessageType.ASCII_BCD, maxLength: 6),

  TUnknown(messageType: POSMessageType.ASCII, maxLength: null),
  ;

  final POSMessageType messageType;
  final int? maxLength;
  const POSServiceTagsEnum(
      {required this.messageType, required this.maxLength});
}
