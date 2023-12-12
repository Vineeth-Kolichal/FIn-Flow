import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';

class AddTransactionModel extends AddTransactionEntity {
  final DateTime date;
  AddTransactionModel(
      {required super.amount,
      required super.isIncome,
      required super.category,
      required super.description,
      required this.date});
  static AddTransactionModel fromEntity(AddTransactionEntity entity) {
    return AddTransactionModel(
      amount: entity.amount,
      isIncome: entity.isIncome,
      category: entity.category,
      description: entity.description,
      date: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "isIncome": isIncome,
        "category": category,
        "description": description,
        "date": Timestamp.fromDate(date)
      };
}
