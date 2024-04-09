// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

/*
Message ID «PUR» Операция Продажа
ECR Number «PC001234» Номер клиента
ERN «12345678» Номер кассового документа
Transaction Amount «10000» Сумма продажи
Transaction Mode 0b10000000 Расширенный формат тэгов в ответе
Local Time 0x20151231235945 Местное время
*/
import 'package:ttk_payment_terminal/src/domain/models/enums/ttk_operations_types.dart';


class PaymentModel {
  final String clientId;
  final String idempotenceKeyERN;
  final double amount;
  final TTKOperationType operationType;
  PaymentModel({
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.amount,
    required this.operationType,
  });

  PaymentModel copyWith({
    String? clientId,
    String? idempotenceKeyERN,
    double? amount,
    TTKOperationType? operationType,
  }) {
    return PaymentModel(
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      amount: amount ?? this.amount,
      operationType: operationType ?? this.operationType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'idempotenceKeyERN': idempotenceKeyERN,
      'amount': amount,
      'operationType': operationType.name,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      amount: map['amount'] as double,
      operationType: TTKOperationType.values.firstWhere((element) => element.name == map['operationType'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) => PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, amount: $amount, operationType: $operationType)';
  }

  @override
  bool operator ==(covariant PaymentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.clientId == clientId &&
      other.idempotenceKeyERN == idempotenceKeyERN &&
      other.amount == amount &&
      other.operationType == operationType;
  }

  @override
  int get hashCode {
    return clientId.hashCode ^
      idempotenceKeyERN.hashCode ^
      amount.hashCode ^
      operationType.hashCode;
  }
}
