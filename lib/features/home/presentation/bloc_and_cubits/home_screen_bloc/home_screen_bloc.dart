import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/domain/usecases/delete_transactions_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_transactions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';
part 'home_screen_bloc.freezed.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  DeleteTransactionUsecase deleteTransactionUsecase;
  GetTransactionsUsecase getTransactionsUsecase;
  HomeScreenBloc(this.getTransactionsUsecase, this.deleteTransactionUsecase)
      : super(HomeScreenState.initial()) {
    on<GetTransactions>((event, emit) async {
      final resp = await getTransactionsUsecase(
          DateParams(fromDate: event.fromDate, toDate: event.toDate));
      final newState = resp.fold((fail) {
        return state.copyWith(
            isLoading: false,
            error: fail.error,
            transactionList: [],
            dErr: null,
            dSuccess: null);
      }, (data) {
        return state.copyWith(
          isLoading: false,
          error: null,
          transactionList: data,
          dErr: null,
          dSuccess: null,
        );
      });
      emit(newState);
    });

    on<DeleteTransaction>((event, emit) async {
      final resp =
          await deleteTransactionUsecase(DeleteParam(event.entity.id!));
      final newState = resp.fold((fail) {
        return state.copyWith(
          isLoading: false,
          error: null,
          dErr: fail.error,
          dSuccess: null,
        );
      }, (msg) {
        final list = state.transactionList;
        final newList =
            list.where((element) => element.id != event.entity.id).toList();

        return state.copyWith(
          transactionList: newList,
          isLoading: false,
          error: null,
          dErr: null,
          dSuccess: msg,
        );
      });
      emit(newState);
    });
  }
}
