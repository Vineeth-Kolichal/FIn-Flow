part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required List<TransactionEntity> transactionList,
    required String? error,
    required bool isLoading,
    required String? dSuccess,
    required String? dErr,
    required String? pdfMsg,
    required bool? isPdfError,
    required DateTime? fromDate,
    required DateTime? todDate,
  }) = _Initial;
  factory HomeScreenState.initial() => const HomeScreenState(
        transactionList: [],
        error: null,
        isLoading: false,
        dErr: null,
        dSuccess: null,
        pdfMsg: null,
        isPdfError: null,
        fromDate: null,
        todDate: null,
      );
}
