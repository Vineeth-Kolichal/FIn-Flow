import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    super.id,
    required super.amount,
    required super.isIncome,
    required super.category,
    required super.description,
    required super.date,
  });
  static TransactionModel fromEntity(TransactionEntity entity) {
    return TransactionModel(
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
        "date": Timestamp.fromDate(date!)
      };
  factory TransactionModel.fromMap(Map<String, dynamic> map) =>
      TransactionModel(
        id: map['id'],
        amount: map['amount'],
        isIncome: map['isIncome'],
        category: map['category'],
        description: map['description'],
        date: map['date'].toDate(),
      );
}
