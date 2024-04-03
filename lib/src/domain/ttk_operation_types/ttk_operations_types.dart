// ignore_for_file: constant_identifier_names

enum TTKOperationTypes {
  PUR,

  /// Sale of goods or services (financial transaction)
  REF,

  /// Refund to a bank card (financial transaction)
  VOI,

  /// Cancel operation by ERN number (financial transaction)
  JRN,

  /// Operation result request by ERN number (financial transaction)
  AUH,

  /// Sale in Preauthorization form (financial transaction)
  AUT,

  /// Preauthorization (financial transaction)
  CMP,

  /// Settlement after preauthorization (financial transaction)
  CSH,

  /// Cash withdrawal (financial transaction)
  CRE,

  /// Cash deposit (financial transaction)
  PAY,

  /// Payment by requisites (financial transaction)
  BAL,

  /// Inquiry of client's card account balance
  SRV,

  /// Service operation
  INF,

  /// Status message
  DLG,

  /// Client screen dialogue request
  ABR,

  /// Interruption of ongoing operation
  MOV,

  /// Card movement
  KCH,

  /// Key change by host request
}
