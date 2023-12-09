part of 'add_transaction_sheet_cubit.dart';

@freezed
class AddTransactionSheetState with _$AddTransactionSheetState {
  const factory AddTransactionSheetState({ required List<String> categories, required String? selected}) =
      _Initial;
  factory AddTransactionSheetState.initial() =>
     const AddTransactionSheetState(categories: ["Select category"],selected: null);
}
