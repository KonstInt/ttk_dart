import 'dart:convert';

import 'package:pos_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_model.dart';

class RequestRefundModel extends RequestModel {
  final double amount;
  final String retrievalReferenceNumber;
  RequestRefundModel({
    required this.amount,
    required this.retrievalReferenceNumber,
    required super.clientId,
    required super.idempotenceKeyERN,
  }) : super(operationType: OperationType.REF);

  @override
  RequestRefundModel copyWith(
      {double? amount,
      String? retrievalReferenceNumber,
      String? clientId,
      String? idempotenceKeyERN,
      OperationType? operationType}) {
    return RequestRefundModel(
      amount: amount ?? this.amount,
      clientId: clientId ?? this.clientId,
      retrievalReferenceNumber:
          retrievalReferenceNumber ?? this.retrievalReferenceNumber,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll(
          <String, dynamic>{'amount': amount, 'rrn': retrievalReferenceNumber});
  }

  factory RequestRefundModel.fromMap(Map<String, dynamic> map) {
    return RequestRefundModel(
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      retrievalReferenceNumber: map['rrn'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory RequestRefundModel.fromJson(String source) =>
      RequestRefundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiPaymentModel(amount: $amount)${super.toString()}';

  @override
  bool operator ==(covariant RequestRefundModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.amount == amount;
  }

  @override
  int get hashCode => amount.hashCode ^ super.hashCode;
}
