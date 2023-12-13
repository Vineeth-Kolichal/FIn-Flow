class TransactionEntity {
  final String? id;
  final double amount;
  final bool isIncome;
  final String category;
  final String description;
  final DateTime? date;

  TransactionEntity({
    this.id,
    required this.amount,
    required this.isIncome,
    required this.category,
    required this.description,
    this.date,
  });
}
