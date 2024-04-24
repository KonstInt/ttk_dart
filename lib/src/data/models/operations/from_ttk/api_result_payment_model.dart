import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_model.dart';

class ApiResultPaymentModel extends ApiResultModel {
  ApiResultPaymentModel({
    required super.clientId,
    required super.idempotenceKeyERN,
    required super.operationType,
    required super.success,
    required this.amount,
    super.receipt,
  });

  factory ApiResultPaymentModel.fromMap(Map<String, dynamic> map) {
    return ApiResultPaymentModel(
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: ApiTTKOperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
      success: map['success'] as bool,
      receipt: map['receipt'] != null ? map['receipt'] as String : null,
    );
  }

  factory ApiResultPaymentModel.fromJson(String source) =>
      ApiResultPaymentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  final double amount;

  @override
  ApiResultPaymentModel copyWith({
    double? amount,
    String? clientId,
    String? idempotenceKeyERN,
    ApiTTKOperationType? operationType,
    bool? success,
    String? receipt,
  }) {
    return ApiResultPaymentModel(
      amount: amount ?? this.amount,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      operationType: operationType ?? this.operationType,
      success: success ?? this.success,
      receipt: receipt ?? this.receipt,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'idempotenceKeyERN': idempotenceKeyERN,
      'operationType': operationType.name,
      'success': success,
      'receipt': receipt,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ApiResultPaymentModel(amount: $amount, clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, operationType: $operationType, success: $success, receipt: $receipt)';
  }

  @override
  bool operator ==(covariant ApiResultPaymentModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.success == success &&
        other.receipt == receipt &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return clientId.hashCode ^
        idempotenceKeyERN.hashCode ^
        operationType.hashCode ^
        success.hashCode ^
        receipt.hashCode ^
        amount.hashCode;
  }
}
