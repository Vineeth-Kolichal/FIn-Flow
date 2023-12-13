part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState(
      {required List<TransactionEntity> transactionList,
      required String? error,
      required bool isLoading}) = _Initial;
  factory HomeScreenState.initial() => HomeScreenState(transactionList: [
        TransactionEntity(
          date: DateTime.now(),
          amount: 1000.0,
          isIncome: true,
          category: "Salary",
          description: "SalaryCredited",
        ),
        TransactionEntity(
          date: DateTime.now(),
          amount: 500.0,
          isIncome: false,
          category: "Shopping",
          description: "pant purchased",
        )
      ], error: null, isLoading: false);
}
