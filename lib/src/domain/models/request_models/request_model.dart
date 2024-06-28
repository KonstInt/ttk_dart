import 'dart:convert';

import 'package:pos_payment_terminal/src/domain/models/enums/response/operations_types.dart';

class RequestModel {
  final String clientId;
  final String idempotenceKeyERN;
  final OperationType operationType;
  final int? organizationCode;
  RequestModel({
    required this.organizationCode,
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.operationType,
  });

  RequestModel copyWith({
    int? organizationCode,
    String? clientId,
    String? idempotenceKeyERN,
    OperationType? operationType,
  }) {
    return RequestModel(
      organizationCode: organizationCode ?? this.organizationCode,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      operationType: operationType ?? this.operationType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'organizationCode': organizationCode,
      'clientId': clientId,
      'idempotenceKeyERN': idempotenceKeyERN,
      'operationType': operationType.name,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      organizationCode: map['organizationCode'] as int,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: OperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiRequestModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, operationType: $operationType, organizationCode: $organizationCode)';
  }

  @override
  bool operator ==(covariant RequestModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.organizationCode == organizationCode;
  }

  @override
  int get hashCode {
    return organizationCode.hashCode ^
        clientId.hashCode ^
        idempotenceKeyERN.hashCode ^
        operationType.hashCode;
  }
}
