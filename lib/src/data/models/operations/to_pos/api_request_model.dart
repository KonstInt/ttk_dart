import 'dart:convert';

import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';

class ApiRequestModel {
  final String clientId;
  final String idempotenceKeyERN;
  final ApiPOSOperationType operationType;
  final int organizationCode;
  ApiRequestModel({
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.operationType,
    required this.organizationCode,
  });

  ApiRequestModel copyWith({
    int? organizationCode,
    String? clientId,
    String? idempotenceKeyERN,
    ApiPOSOperationType? operationType,
  }) {
    return ApiRequestModel(
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

  factory ApiRequestModel.fromMap(Map<String, dynamic> map) {
    return ApiRequestModel(
      organizationCode: map['organizationCode'] as int,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: ApiPOSOperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiRequestModel.fromJson(String source) =>
      ApiRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiRequestModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, operationType: $operationType,  organization code: $organizationCode)';
  }

  @override
  bool operator ==(covariant ApiRequestModel other) {
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
