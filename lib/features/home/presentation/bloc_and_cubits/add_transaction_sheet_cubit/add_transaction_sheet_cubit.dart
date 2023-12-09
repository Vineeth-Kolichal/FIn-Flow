import 'package:bloc/bloc.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_transaction_sheet_state.dart';
part 'add_transaction_sheet_cubit.freezed.dart';

class AddTransactionSheetCubit extends Cubit<AddTransactionSheetState> {
  AddTransactionSheetCubit() : super(AddTransactionSheetState.initial());
  void getCategories(TransactionType type) {
    List<String> categories;
    // emit(state.copyWith(type: type));
    final income = ["Salary", "Profit", "Divident"];
    final expence = ["Food", "Travel", "Shopping"];
    if (type == TransactionType.income) {
      categories = income;
      emit(state.copyWith(categories: categories, selected: null));
    } else {
      categories = expence;
      emit(state.copyWith(categories: categories, selected: null));
    }
  }

  void selectCategories(String seleted) {
    emit(state.copyWith(selected: seleted));
  }
}
