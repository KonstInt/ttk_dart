// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ttk_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:ttk_payment_terminal/src/domain/models/response_models/response_operation_model.dart';

class ResponseOperationServiceModel extends ResponseOperationModel {
  ResponseOperationServiceModel({
    required super.clientId,
    required super.idempotenceKeyERN,
    required super.operationType,
    required super.success,
    required super.date,
    required super.time,
    super.receipt,
  });

  @override
  ResponseOperationServiceModel copyWith({
    String? clientId,
    String? idempotenceKeyERN,
    OperationType? operationType,
    bool? success,
    String? receipt,
    String? date,
    String? time,
  }) {
    return ResponseOperationServiceModel(
        clientId: clientId ?? this.clientId,
        idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
        operationType: operationType ?? this.operationType,
        success: success ?? this.success,
        receipt: receipt ?? this.receipt,
        date: date ?? this.date,
        time: time ?? this.time);
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()..addAll(<String, dynamic>{});
  }

  factory ResponseOperationServiceModel.fromMap(Map<String, dynamic> map) {
    return ResponseOperationServiceModel(
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

  @override
  String toJson() => json.encode(toMap());

  factory ResponseOperationServiceModel.fromJson(String source) =>
      ResponseOperationServiceModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiResultServiceModel(${super.toString()}';

  @override
  bool operator ==(covariant ResponseOperationServiceModel other) {
    if (identical(this, other)) return true;

    return super == other;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes, unnecessary_overrides
  int get hashCode => super.hashCode;
}
