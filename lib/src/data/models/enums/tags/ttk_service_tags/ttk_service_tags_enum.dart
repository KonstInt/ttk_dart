// ignore_for_file: constant_identifier_names

enum TTKServiceTagsEnum {
  /// Message ID | ASCII | 3
  T81,

  /// ECR number | ASCII | 10
  T82,

  /// ERN | ASCII-BCD | 10
  T83,

  /// Response Code | ASCII | 3
  T9B,

  /// Transaction Amount | ASCII-BCD | 12
  T84,

  /// PAN | ASCII | 19
  T89,

  /// Invoice Number | ASCII-BCD | 6
  T8B,

  /// Authorization ID | ASCII | 6
  T8C,

  /// Date | ASCII-BCD | 8
  T8D,

  /// Time | ASCII-BCD | 6
  T8E,

  /// Issuer Name | ASCII | 18
  T8F,

  /// Merchant No | ASCII | 15
  T90,

  /// POS Entry Mode | ASCII-HEX | 3
  T92,

  /// POS Condition Code | ASCII-HEX | 2
  T93,

  /// Cardholder Verification Method | ASCII | 1
  T94,

  /// TVR | BIN | 5
  T95,

  /// RRN | ASCII-BCD | 12
  T98,

  /// Batch No | ASCII-BCD | 6
  T99,

  /// Terminal ID | ASCII | 8
  T9D,

  /// Receipt PDS | BIN
  T9E,

  /// Receipt Second PDS | BIN
  T9F0E,

  /// Application ID | BIN | 8
  T9F06,

  /// TC | BIN | 8
  T9F26,

  /// Visual Host Response | ASCII | 41
  TAO,

  /// Approve | ASCII | 1
  TA1,

  /// Transaction Amount #2 | ASCII-BCD | 12
  TA2,

  /// Application Label | ASCII | 16
  T50,

  /// Currency | ASCII | 3
  TC1,

  /// Decimal Point | ASCII-BCD | 1
  TC2,

  /// Reader command result | BIN
  TCD,

  /// Local time | BCD | 7
  TCE,

  /// Status ID | ASCII-BCD | 3
  T1F70,

  /// Status Text | ASCII
  T1F71,

  /// Input Template ID | ASCII-BCD | 3
  T1F72,

  /// Input Min Length | ASCII-BCD | 2
  T1F73,

  /// Input Max Length | ASCII-BCD | 2
  T1F74,

  /// Input Format | ASCII-BCD | 1
  T1F75,

  /// Input Caption | ASCII
  T1F76,

  /// Input Text | ASCII
  T1F77,

  /// Input Default Value | ASCII
  T1F78,

  /// Input Currency | ASCII | 3
  T1F79,

  /// Input Decimal Point | ASCII-BCD | 1
  T1F7A,

  /// Input Items | ASCII
  T1F7B,

  /// Timeout | ASCII-BCD | 6
  T1F7C,
}
