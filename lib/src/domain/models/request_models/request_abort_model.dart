import 'package:pos_payment_terminal/src/domain/models/enums/response/operations_types.dart';
import 'package:pos_payment_terminal/src/domain/models/request_models/request_model.dart';

class RequestAbortModel extends RequestModel {
  RequestAbortModel(
      {required super.clientId,
      required super.idempotenceKeyERN,
      required super.organizationCode})
      : super(operationType: OperationType.ABR);

  @override
  RequestAbortModel copyWith(
      {int? organizationCode,
      String? clientId,
      String? idempotenceKeyERN,
      OperationType? operationType}) {
    return RequestAbortModel(
      organizationCode: organizationCode ?? this.organizationCode,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
    );
  }
}
