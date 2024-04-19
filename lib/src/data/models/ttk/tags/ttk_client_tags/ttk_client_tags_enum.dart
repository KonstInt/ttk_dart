enum TTKClientTagsEnum {
  /// Message ID | ASCII | 3
  T01,

  /// ECR number | ASCII | 10
  T02,

  /// ERN | ASCII-BCD | 10
  T03,

  /// Transaction Amount | ASCII-BCD | 12
  T04,

  /// Transaction Mode | BIN | 00000000
  T08,

  /// PAN | ASCII | 19
  T09,

  /// Invoice Number | ASCII-BCD | 6
  T0B,

  /// Authorization ID | ASCII | 6
  T0C,

  /// Order Details | ASCII |
  T0D,

  /// Commodity Code | ASCII |
  T0E,

  /// RRN | ASCII-BCD | 12
  T18,

  /// SRV subfunction | ASCII-HEX | 1
  T1A,

  /// Currency | ASCII-BCD | 3
  T1B,

  /// Language | ASCII | 2
  T1C,

  /// Reader command | BIN
  T1D,

  /// Local Time | BCD | 7
  T1E,

  /// Input Code | ASCII-BCD | 1
  T1F00,

  /// Input Data | ASCII
  T1F01,
}
