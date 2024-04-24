// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operation_service_type.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_request_model.dart';

class ApiReconciliationModel extends ApiRequestModel {
  final ApiTTKOperationServiceType serviceType;
  ApiReconciliationModel({
    required String clientId,
    required String idempotenceKeyERN,
    required this.serviceType,
  }) : super(
            clientId: clientId,
            idempotenceKeyERN: idempotenceKeyERN,
            operationType: ApiTTKOperationType.SRV);

  @override
  ApiReconciliationModel copyWith(
      {ApiTTKOperationServiceType? serviceType,
      String? clientId,
      String? idempotenceKeyERN,
      ApiTTKOperationType? operationType}) {
    return ApiReconciliationModel(
      serviceType: serviceType ?? this.serviceType,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll(<String, dynamic>{
        'serviceType': serviceType.value,
      });
  }

  factory ApiReconciliationModel.fromMap(Map<String, dynamic> map) {
    return ApiReconciliationModel(
        clientId: map['clientId'] as String,
        idempotenceKeyERN: map['idempotenceKeyERN'] as String,
        serviceType: ApiTTKOperationServiceType.values.firstWhere(
            (element) => map['serviceType'] as String == element.value));
  }

  @override
  String toJson() => json.encode(toMap());

  factory ApiReconciliationModel.fromJson(String source) =>
      ApiReconciliationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiReconciliationModel(serviceType: $serviceType)${super}';

  @override
  bool operator ==(covariant ApiReconciliationModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.serviceType == serviceType;
  }

  @override
  int get hashCode => serviceType.hashCode ^ super.hashCode;
}
