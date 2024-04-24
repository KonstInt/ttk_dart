// ignore_for_file: constant_identifier_names

enum ApiTTKOperationType {
  /// Sale of goods or services (financial transaction)
  PUR,

  /// Refund to a bank card (financial transaction)
  REF,

  /// Cancel operation by ERN number (financial transaction)
  VOI,

  /// Operation result request by ERN number (financial transaction)
  JRN,

  /// Sale in Preauthorization form (financial transaction)
  AUH,

  /// Preauthorization (financial transaction)
  AUT,

  /// Settlement after preauthorization (financial transaction)
  CMP,

  /// Cash withdrawal (financial transaction)
  CSH,

  /// Cash deposit (financial transaction)
  CRE,

  /// Payment by requisites (financial transaction)
  PAY,

  /// Inquiry of client's card account balance
  BAL,

  /// Service operation
  SRV,

  /// Status message
  INF,

  /// Client screen dialogue request
  DLG,

  /// Interruption of ongoing operation
  ABR,

  /// Card movement
  MOV,

  /// Key change by host request
  KCH,
}
