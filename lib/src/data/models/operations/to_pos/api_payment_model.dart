import 'dart:convert';

import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_request_model.dart';

class ApiPaymentModel extends ApiRequestModel {
  final double amount;

  ApiPaymentModel({
    required this.amount,
    required super.organizationCode,
    required super.clientId,
    required super.idempotenceKeyERN,
  }) : super(operationType: ApiPOSOperationType.PUR);

  @override
  ApiPaymentModel copyWith(
      {int? organizationCode,
      double? amount,
      String? clientId,
      String? idempotenceKeyERN,
      ApiPOSOperationType? operationType}) {
    return ApiPaymentModel(
      organizationCode: organizationCode ?? this.organizationCode,
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
      organizationCode: map['organizationCode'] as int,
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
  String toString() => 'ApiPaymentModel(amount: $amount)${super.toString()}';

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
