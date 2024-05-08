// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ttk_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:ttk_payment_terminal/src/domain/models/request_models/request_model.dart';

class RequestPaymentModel extends RequestModel {
  final double amount;
  RequestPaymentModel({
    required this.amount,
    required String clientId,
    required String idempotenceKeyERN,
  }) : super(
            clientId: clientId,
            idempotenceKeyERN: idempotenceKeyERN,
            operationType: OperationType.PUR);

  @override
  RequestPaymentModel copyWith(
      {double? amount,
      String? clientId,
      String? idempotenceKeyERN,
      OperationType? operationType}) {
    return RequestPaymentModel(
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

  factory RequestPaymentModel.fromMap(Map<String, dynamic> map) {
    return RequestPaymentModel(
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory RequestPaymentModel.fromJson(String source) =>
      RequestPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiPaymentModel(amount: $amount)${super.toString()}';

  @override
  bool operator ==(covariant RequestPaymentModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.amount == amount;
  }

  @override
  int get hashCode => amount.hashCode ^ super.hashCode;
}
