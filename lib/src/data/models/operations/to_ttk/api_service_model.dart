// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operation_service_type.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/enums/to_ttk/api_ttk_operations_types.dart';
import 'package:ttk_payment_terminal/src/data/models/operations/to_ttk/api_request_model.dart';

class ApiServiceModel extends ApiRequestModel {
  final ApiTTKOperationServiceType serviceType;
  ApiServiceModel({
    required String clientId,
    required String idempotenceKeyERN,
    required this.serviceType,
  }) : super(
            clientId: clientId,
            idempotenceKeyERN: idempotenceKeyERN,
            operationType: ApiTTKOperationType.SRV);

  @override
  ApiServiceModel copyWith(
      {ApiTTKOperationServiceType? serviceType,
      String? clientId,
      String? idempotenceKeyERN,
      ApiTTKOperationType? operationType}) {
    return ApiServiceModel(
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

  factory ApiServiceModel.fromMap(Map<String, dynamic> map) {
    return ApiServiceModel(
        clientId: map['clientId'] as String,
        idempotenceKeyERN: map['idempotenceKeyERN'] as String,
        serviceType: ApiTTKOperationServiceType.values.firstWhere(
            (element) => map['serviceType'] as String == element.value));
  }

  @override
  String toJson() => json.encode(toMap());

  factory ApiServiceModel.fromJson(String source) =>
      ApiServiceModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiReconciliationModel(serviceType: $serviceType)${super.toString()}';

  @override
  bool operator ==(covariant ApiServiceModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.serviceType == serviceType;
  }

  @override
  int get hashCode => serviceType.hashCode ^ super.hashCode;
}
