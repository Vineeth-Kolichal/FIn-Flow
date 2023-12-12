class AddTransactionEntity {
  final double amount;
  final bool isIncome;
  final String category;
  final String description;

  AddTransactionEntity({
    required this.amount,
    required this.isIncome,
    required this.category,
    required this.description,
  });
}
