// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:ttk_payment_terminal/src/domain/models/enums/response/operations_types.dart';

class ResponseOperationModel {
  final String clientId;
  final String idempotenceKeyERN;
  final OperationType operationType;
  final bool success;
  final String? receipt;
  final String date;
  final String time;
  ResponseOperationModel({
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.operationType,
    required this.success,
    required this.date,
    required this.time,
    this.receipt,
  });

  ResponseOperationModel copyWith(
      {String? clientId,
      String? idempotenceKeyERN,
      OperationType? operationType,
      bool? success,
      String? receipt,
      String? date,
      String? time}) {
    return ResponseOperationModel(
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

  factory ResponseOperationModel.fromMap(Map<String, dynamic> map) {
    return ResponseOperationModel(
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: OperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
      success: map['success'] as bool,
      receipt: map['receipt'] != null ? map['receipt'] as String : null,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseOperationModel.fromJson(String source) =>
      ResponseOperationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiResultModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, operationType: $operationType, success: $success, receipt: $receipt)';
  }

  @override
  bool operator ==(covariant ResponseOperationModel other) {
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
