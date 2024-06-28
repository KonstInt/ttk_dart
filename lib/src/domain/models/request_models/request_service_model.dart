import 'dart:convert';

import 'package:pos_payment_terminal/src/domain/models/enums/response/operation_service_type.dart';
import 'package:pos_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_model.dart';

class RequestServiceModel extends RequestModel {
  final OperationServiceType serviceType;
  RequestServiceModel(
      {required super.clientId,
      required super.idempotenceKeyERN,
      required this.serviceType,
      required super.organizationCode})
      : super(operationType: OperationType.SRV);

  @override
  RequestServiceModel copyWith(
      {int? organizationCode,
      OperationServiceType? serviceType,
      String? clientId,
      String? idempotenceKeyERN,
      OperationType? operationType}) {
    return RequestServiceModel(
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

  factory RequestServiceModel.fromMap(Map<String, dynamic> map) {
    return RequestServiceModel(
        //TODO: organisation code is nullable, and should redo it
        organizationCode: map[' organizationCode'] as int,
        clientId: map['clientId'] as String,
        idempotenceKeyERN: map['idempotenceKeyERN'] as String,
        serviceType: OperationServiceType.values.firstWhere(
            (element) => map['serviceType'] as String == element.value));
  }

  @override
  String toJson() => json.encode(toMap());

  factory RequestServiceModel.fromJson(String source) =>
      RequestServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiReconciliationModel(serviceType: $serviceType)${super.toString()}';

  @override
  bool operator ==(covariant RequestServiceModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.operationType == operationType &&
        other.serviceType == serviceType;
  }

  @override
  int get hashCode => serviceType.hashCode ^ super.hashCode;
}
