import 'dart:convert';

import 'package:ttk_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_model.dart';


class ResponseOperationPaymentModel extends ResponseOperationModel {
  ResponseOperationPaymentModel({
    required super.clientId,
    required super.idempotenceKeyERN,
    required super.operationType,
    required super.success,
    required super.date,
    required super.time,
    required this.amount,
    required this.retrievalReferenceNumber,
    super.receipt,
  });

  factory ResponseOperationPaymentModel.fromMap(Map<String, dynamic> map) {
    return ResponseOperationPaymentModel(
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: OperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
      success: map['success'] as bool,
      retrievalReferenceNumber: map['rrn'] as String,
      receipt: map['receipt'] != null ? map['receipt'] as String : null,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  factory ResponseOperationPaymentModel.fromJson(String source) =>
      ResponseOperationPaymentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  final double amount;
  final String? retrievalReferenceNumber;

  @override
  ResponseOperationPaymentModel copyWith({
    double? amount,
    String? clientId,
    String? idempotenceKeyERN,
    OperationType? operationType,
    bool? success,
    String? receipt,
    String? retrievalReferenceNumber,
    String? date,
    String? time,
  }) {
    return ResponseOperationPaymentModel(
      amount: amount ?? this.amount,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      operationType: operationType ?? this.operationType,
      success: success ?? this.success,
      receipt: receipt ?? this.receipt,
      retrievalReferenceNumber:
          retrievalReferenceNumber ?? this.retrievalReferenceNumber,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll(
          <String, dynamic>{'rrn': retrievalReferenceNumber, 'amount': amount});
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ApiResultPaymentModel(rrn: $retrievalReferenceNumber, amount: $amount)${super.toString()}';
  }

  @override
  bool operator ==(covariant ResponseOperationPaymentModel other) {
    if (identical(this, other)) return true;

    return other.amount == amount &&
        other.retrievalReferenceNumber == retrievalReferenceNumber &&
        super == other;
  }

  @override
  int get hashCode {
    return super.hashCode ^ amount.hashCode ^ retrievalReferenceNumber.hashCode;
  }
}
