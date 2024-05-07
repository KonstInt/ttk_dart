// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operation_service_type.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/from_ttk/api_result_model.dart';

class ApiResultServiceModel extends ApiResultModel {
  ApiResultServiceModel({
    required super.clientId,
    required super.idempotenceKeyERN,
    required super.operationType,
    required super.success,
    required super.date,
    required super.time,
    super.receipt,
  });

  @override
  ApiResultServiceModel copyWith({
    String? clientId,
    String? idempotenceKeyERN,
    ApiTTKOperationType? operationType,
    bool? success,
    String? receipt,
    String? date,
    String? time,
  }) {
    return ApiResultServiceModel(
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
    return super.toMap()
      ..addAll(<String, dynamic>{
      });
  }

  factory ApiResultServiceModel.fromMap(Map<String, dynamic> map) {
    return ApiResultServiceModel(
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

  @override
  String toJson() => json.encode(toMap());

  factory ApiResultServiceModel.fromJson(String source) =>
      ApiResultServiceModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiResultServiceModel(${super.toString()}';

  @override
  bool operator ==(covariant ApiResultServiceModel other) {
    if (identical(this, other)) return true;

    return super == other;
  }

  @override
  int get hashCode => super.hashCode;
}
