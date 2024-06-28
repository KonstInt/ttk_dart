import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_request_model.dart';

class ApiAbortModel extends ApiRequestModel {
  ApiAbortModel({
    required super.clientId,
    required super.idempotenceKeyERN,
    required super.organizationCode,
  }) : super(operationType: ApiPOSOperationType.ABR);

  @override
  ApiAbortModel copyWith(
      {int? organizationCode,
      String? clientId,
      String? idempotenceKeyERN,
      ApiPOSOperationType? operationType}) {
    return ApiAbortModel(
      organizationCode: organizationCode ?? this.organizationCode,
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
    );
  }
}
