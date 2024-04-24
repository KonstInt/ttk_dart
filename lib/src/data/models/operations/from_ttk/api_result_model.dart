// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';

class ApiResultModel {
  final String clientId;
  final String idempotenceKeyERN;
  final ApiTTKOperationType operationType;
  final bool success;
  final String? receipt;
  ApiResultModel({
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.operationType,
    required this.success,
    this.receipt,
  });

  ApiResultModel copyWith({
    String? clientId,
    String? idempotenceKeyERN,
    ApiTTKOperationType? operationType,
    bool? success,
    String? receipt,
  }) {
    return ApiResultModel(
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      operationType: operationType ?? this.operationType,
      success: success ?? this.success,
      receipt: receipt ?? this.receipt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'idempotenceKeyERN': idempotenceKeyERN,
      'operationType': operationType.name,
      'success': success,
      'receipt': receipt,
    };
  }

  factory ApiResultModel.fromMap(Map<String, dynamic> map) {
    return ApiResultModel(
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: ApiTTKOperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
      success: map['success'] as bool,
      receipt: map['receipt'] != null ? map['receipt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResultModel.fromJson(String source) =>
      ApiResultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiResultModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, operationType: $operationType, success: $success, receipt: $receipt)';
  }

  @override
  bool operator ==(covariant ApiResultModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.success == success &&
        other.receipt == receipt;
  }

  @override
  int get hashCode {
    return clientId.hashCode ^
        idempotenceKeyERN.hashCode ^
        operationType.hashCode ^
        success.hashCode ^
        receipt.hashCode;
  }
}
