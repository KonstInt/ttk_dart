// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:ttk_payment_terminal/src/domain/models/enums/ttk_payment_error_type.dart';

class TTKPaymentError {
  final String message;
  final TTKPaymentErrorType errorType;
  TTKPaymentError({
    required this.message,
    required this.errorType,
  });

  TTKPaymentError copyWith({
    String? message,
    TTKPaymentErrorType? errorType,
  }) {
    return TTKPaymentError(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'errorType': errorType.name,
    };
  }

  factory TTKPaymentError.fromMap(Map<String, dynamic> map) {
    return TTKPaymentError(
      message: map['message'] as String,
      errorType: TTKPaymentErrorType.values
          .firstWhere((element) => element.name == map['errorType'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory TTKPaymentError.fromJson(String source) =>
      TTKPaymentError.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TTKPaymentError(message: $message, errorType: $errorType)';

  @override
  bool operator ==(covariant TTKPaymentError other) {
    if (identical(this, other)) return true;

    return other.message == message && other.errorType == errorType;
  }

  @override
  int get hashCode => message.hashCode ^ errorType.hashCode;
}
