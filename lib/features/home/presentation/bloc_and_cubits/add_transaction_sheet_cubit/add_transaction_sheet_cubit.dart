import 'package:bloc/bloc.dart';
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_transaction_sheet_state.dart';
part 'add_transaction_sheet_cubit.freezed.dart';

@injectable
class AddTransactionSheetCubit extends Cubit<AddTransactionSheetState> {
  GetCategoriesUseCase getCategoriesUseCase;
  AddTransactionSheetCubit(this.getCategoriesUseCase)
      : super(AddTransactionSheetState.initial());
  void getCategories(TransactionType type) {
    if (type == TransactionType.income) {
      getCategoriesUseCase(Cparams('income')).then((value) {
        value.fold((fail) {
          emit(state.copyWith(categories: [], selected: null, err: fail.error));
        }, (data) {
          emit(state.copyWith(categories: data, selected: null));
        });
      });
    } else {
      getCategoriesUseCase(Cparams('expence')).then((value) {
        value.fold((fail) {
          emit(state.copyWith(categories: [], selected: null, err: fail.error));
        }, (data) {
          emit(state.copyWith(categories: data, selected: null));
        });
      });
    }
  }

  void selectCategories(String seleted) {
    emit(state.copyWith(selected: seleted));
  }
}
