// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_request_model.dart';

class ApiPaymentModel extends ApiRequestModel {
  final double amount;
  ApiPaymentModel({
    required this.amount,
    required String clientId,
    required String idempotenceKeyERN,
  }) : super(
            clientId: clientId,
            idempotenceKeyERN: idempotenceKeyERN,
            operationType: ApiTTKOperationType.PUR);

  @override
  ApiPaymentModel copyWith(
      {double? amount,
      String? clientId,
      String? idempotenceKeyERN,
      ApiTTKOperationType? operationType}) {
    return ApiPaymentModel(
      amount: amount ?? this.amount,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll(<String, dynamic>{
        'amount': amount,
      });
  }

  factory ApiPaymentModel.fromMap(Map<String, dynamic> map) {
    return ApiPaymentModel(
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ApiPaymentModel.fromJson(String source) =>
      ApiPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiPaymentModel(amount: $amount)${super}';

  @override
  bool operator ==(covariant ApiPaymentModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.amount == amount;
  }

  @override
  int get hashCode => amount.hashCode ^ super.hashCode;
}
