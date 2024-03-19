
enum TTKClientTagsEnum {
  T01, /// Message ID | ASCII | 3
  T02, /// ECR number | ASCII | 10
  T03, /// ERN | ASCII-BCD | 10
  T04, /// Transaction Amount | ASCII-BCD | 12
  T08, /// Transaction Mode | BIN | 00000000
  T09, /// PAN | ASCII | 19
  T0B, /// Invoice Number | ASCII-BCD | 6
  T0C, /// Authorization ID | ASCII | 6
  T0D, /// Order Details | ASCII | 
  T0E, /// Commodity Code | ASCII |
  T18, /// RRN | ASCII-BCD | 12
  T1A, /// SRV subfunction | ASCII-HEX | 1
  T1B, /// Currency | ASCII-BCD | 3 
  T1C, /// Language | ASCII | 2
  T1D, /// Reader command | BIN 
  T1E, /// Local Time | BCD | 7 
  T1F00, /// Input Code | ASCII-BCD | 1
  T1F01, /// Input Data | ASCII
}

