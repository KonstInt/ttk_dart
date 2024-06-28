import 'dart:convert';

import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operation_service_type.dart';
import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_request_model.dart';

class ApiServiceModel extends ApiRequestModel {
  final ApiPOSOperationServiceType serviceType;
  ApiServiceModel({
    required super.clientId,
    required super.idempotenceKeyERN,
    required this.serviceType,
    required super.organizationCode,
  }) : super(operationType: ApiPOSOperationType.SRV);

  @override
  ApiServiceModel copyWith(
      {int? organizationCode,
      ApiPOSOperationServiceType? serviceType,
      String? clientId,
      String? idempotenceKeyERN,
      ApiPOSOperationType? operationType}) {
    return ApiServiceModel(
      organizationCode: organizationCode ?? this.organizationCode,
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
        organizationCode: map['organizationCode'] as int,
        clientId: map['clientId'] as String,
        idempotenceKeyERN: map['idempotenceKeyERN'] as String,
        serviceType: ApiPOSOperationServiceType.values.firstWhere(
            (element) => map['serviceType'] as String == element.value));
  }

  @override
  String toJson() => json.encode(toMap());

  factory ApiServiceModel.fromJson(String source) =>
      ApiServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
