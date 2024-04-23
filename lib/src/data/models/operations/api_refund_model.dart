// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/api_request_model.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/enums/api_ttk_operations_types.dart';

class ApiRefundModel extends ApiRequestModel {
  final double amount;
  ApiRefundModel(
      {required this.amount,
      required String clientId,
      required String idempotenceKeyERN,
      })
      : super(
            clientId: clientId,
            idempotenceKeyERN: idempotenceKeyERN,
            operationType: ApiTTKOperationType.REF);

  @override
  ApiRefundModel copyWith(
      {double? amount,
      String? clientId,
      String? idempotenceKeyERN,
      ApiTTKOperationType? operationType}) {
    return ApiRefundModel(
        amount: amount ?? this.amount,
        clientId: clientId ?? this.clientId,
        idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
        );
  }

  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll(<String, dynamic>{
        'amount': amount,
      });
  }

  factory ApiRefundModel.fromMap(Map<String, dynamic> map) {
    return ApiRefundModel(
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
    
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiRefundModel.fromJson(String source) =>
      ApiRefundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiPaymentModel(amount: $amount)';

  @override
  bool operator ==(covariant ApiRefundModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.amount == amount;
  }

  @override
  int get hashCode => amount.hashCode^super.hashCode;
}
