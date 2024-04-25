import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_model.dart';

class ApiResultRefundModel extends ApiResultModel {
  ApiResultRefundModel({
    required super.clientId,
    required super.idempotenceKeyERN,
    required super.operationType,
    required super.success,
    required super.date,
    required super.time,
    required this.amount,
    super.receipt,
  });

  factory ApiResultRefundModel.fromMap(Map<String, dynamic> map) {
    return ApiResultRefundModel(
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      operationType: ApiTTKOperationType.values.firstWhere(
          (element) => element.name == map['operationType'] as String),
      success: map['success'] as bool,
      receipt: map['receipt'] != null ? map['receipt'] as String : null,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  factory ApiResultRefundModel.fromJson(String source) =>
      ApiResultRefundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final double amount;

  @override
  ApiResultRefundModel copyWith({
    double? amount,
    String? clientId,
    String? idempotenceKeyERN,
    ApiTTKOperationType? operationType,
    bool? success,
    String? receipt,
    String? date,
    String? time,
  }) {
    return ApiResultRefundModel(
      amount: amount ?? this.amount,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      operationType: operationType ?? this.operationType,
      success: success ?? this.success,
      receipt: receipt ?? this.receipt,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll(<String, dynamic>{
        'amount': amount,
      });
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ApiResultPaymentModel(amount: $amount)${super}';
  }

  @override
  bool operator ==(covariant ApiResultRefundModel other) {
    if (identical(this, other)) return true;

    return super == other && other.amount == amount;
  }

  @override
  int get hashCode {
    return super.hashCode ^ amount.hashCode;
  }
}
