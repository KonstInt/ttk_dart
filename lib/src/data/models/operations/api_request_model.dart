// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/api_ttk_operations_types.dart';

class ApiRequestModel {
  final String clientId;
  final String idempotenceKeyERN;
  final ApiTTKOperationType operationType;
  
  ApiRequestModel({
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.operationType,
  });

  ApiRequestModel copyWith({
    String? clientId,
    String? idempotenceKeyERN,
    ApiTTKOperationType? operationType,
  }) {
    return ApiRequestModel(
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      operationType: operationType ?? this.operationType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'idempotenceKeyERN': idempotenceKeyERN,
      'operationType': operationType.name,
    };
  }

  factory ApiRequestModel.fromMap(Map<String, dynamic> map) {
    return ApiRequestModel(
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: ApiTTKOperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiRequestModel.fromJson(String source) => ApiRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiRequestModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, operationType: $operationType)';
  }

  @override
  bool operator ==(covariant ApiRequestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.clientId == clientId &&
      other.idempotenceKeyERN == idempotenceKeyERN &&
      other.operationType == operationType;
  }

  @override
  int get hashCode {
    return clientId.hashCode ^
      idempotenceKeyERN.hashCode ^
      operationType.hashCode;
  }
}
