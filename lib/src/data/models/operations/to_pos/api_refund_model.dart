import 'dart:convert';

import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_request_model.dart';

class ApiRefundModel extends ApiRequestModel {
  final double amount;
  final String retrievalReferenceNumber;
  ApiRefundModel({
    required this.amount,
    required this.retrievalReferenceNumber,
    required super.clientId,
    required super.idempotenceKeyERN,
    required super.organizationCode,
  }) : super(operationType: ApiPOSOperationType.REF);

  @override
  ApiRefundModel copyWith(
      {int? organizationCode,
      double? amount,
      String? retrievalReferenceNumber,
      String? clientId,
      String? idempotenceKeyERN,
      ApiPOSOperationType? operationType}) {
    return ApiRefundModel(
      organizationCode: organizationCode ?? this.organizationCode,
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

  factory ApiRefundModel.fromMap(Map<String, dynamic> map) {
    return ApiRefundModel(
      organizationCode: map['organizationCode'],
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      retrievalReferenceNumber: map['rrn'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ApiRefundModel.fromJson(String source) =>
      ApiRefundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiPaymentModel(amount: $amount)${super.toString()}';

  @override
  bool operator ==(covariant ApiRefundModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.amount == amount;
  }

  @override
  int get hashCode => amount.hashCode ^ super.hashCode;
}
