import 'package:pos_payment_terminal/src/data/models/operations/enums/to_pos/api_pos_operations_types.dart';
import 'package:pos_payment_terminal/src/data/models/operations/to_pos/api_request_model.dart';

class ApiAbortModel extends ApiRequestModel {
  ApiAbortModel({
    required super.clientId,
    required super.idempotenceKeyERN,
  }) : super(operationType: ApiPOSOperationType.ABR);

  @override
  ApiAbortModel copyWith(
      {String? clientId,
      String? idempotenceKeyERN,
      ApiPOSOperationType? operationType}) {
    return ApiAbortModel(
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
    );
  }
}
