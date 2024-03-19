enum TTKServiceTagsEnum {
  T81, /// Message ID | ASCII | 3
  T82, /// ECR number | ASCII | 10
  T83, /// ERN | ASCII-BCD | 10
  T9B, /// Response Code | ASCII | 3
  T84, /// Transaction Amount | ASCII-BCD | 12
  T89, /// PAN | ASCII | 19
  T8B, /// Invoice Number | ASCII-BCD | 6
  T8C, /// Authorization ID | ASCII | 6
  T8D, /// Date | ASCII-BCD | 8
  T8E, /// Time | ASCII-BCD | 6
  T8F, /// Issuer Name | ASCII | 18
  T90, /// Merchant No | ASCII | 15
  T92, /// POS Entry Mode | ASCII-HEX | 3
  T93, /// POS Condition Code | ASCII-HEX | 2
  T94, /// Cardholder Verification Method | ASCII | 1
  T95, /// TVR | BIN | 5
  T98, /// RRN | ASCII-BCD | 12
  T99, /// Batch No | ASCII-BCD | 6
  T9D, /// Terminal ID | ASCII | 8
  T9E, /// Receipt PDS | BIN
  T9F0E, /// Receipt Second PDS | BIN
  T9F06, /// Application ID | BIN | 8
  T9F26, /// TC | BIN | 8
  TAO, /// Visual Host Response | ASCII | 41
  TA1, /// Approve | ASCII | 1
  TA2, /// Transaction Amount #2 | ASCII-BCD | 12
  T50, /// Application Label | ASCII | 16
  TC1, /// Currency | ASCII | 3
  TC2, /// Decimal Point | ASCII-BCD | 1
  TCD, /// Reader command result | BIN
  TCE, /// Local time | BCD | 7
  T1F70, /// Status ID | ASCII-BCD | 3
  T1F71, /// Status Text | ASCII
  T1F72, /// Input Template ID | ASCII-BCD | 3
  T1F73, /// Input Min Length | ASCII-BCD | 2
  T1F74, /// Input Max Length | ASCII-BCD | 2
  T1F75, /// Input Format | ASCII-BCD | 1
  T1F76, /// Input Caption | ASCII
  T1F77, /// Input Text | ASCII
  T1F78, /// Input Default Value | ASCII
  T1F79, /// Input Currency | ASCII | 3
  T1F7A, /// Input Decimal Point | ASCII-BCD | 1
  T1F7B, /// Input Items | ASCII
  T1F7C, /// Timeout | ASCII-BCD | 6
}

