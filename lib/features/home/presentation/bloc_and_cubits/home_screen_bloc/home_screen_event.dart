part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.getTransactions({
    required DateTime fromDate,
    required DateTime toDate,
  }) = GetTransactions;

  const factory HomeScreenEvent.deleteTransaction({required String id}) =
      DeleteTransaction;
}
