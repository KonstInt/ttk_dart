import 'dart:convert';

import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';

class ApiResultModel {
  final String clientId;
  final String idempotenceKeyERN;
  final ApiPOSOperationType operationType;
  final bool success;
  final String? receipt;
  final String date;
  final String time;
  ApiResultModel({
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.operationType,
    required this.success,
    required this.date,
    required this.time,
    this.receipt,
  });

  ApiResultModel copyWith(
      {String? clientId,
      String? idempotenceKeyERN,
      ApiPOSOperationType? operationType,
      bool? success,
      String? receipt,
      String? date,
      String? time}) {
    return ApiResultModel(
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      operationType: operationType ?? this.operationType,
      success: success ?? this.success,
      receipt: receipt ?? this.receipt,
      date: date ?? this.date,
      time: time ?? this.time,
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
      operationType: ApiPOSOperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
      success: map['success'] as bool,
      receipt: map['receipt'] != null ? map['receipt'] as String : null,
      date: map['date'] as String,
      time: map['time'] as String,
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
