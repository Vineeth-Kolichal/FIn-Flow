part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState(
      {required List<TransactionEntity> transactionList,
      required String? error,
      required bool isLoading}) = _Initial;
  factory HomeScreenState.initial() =>
      const HomeScreenState(transactionList: [], error: null, isLoading: false);
}
