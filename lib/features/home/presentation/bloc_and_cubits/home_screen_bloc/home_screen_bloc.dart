import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/domain/usecases/get_transactions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';
part 'home_screen_bloc.freezed.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  GetTransactionsUsecase getTransactionsUsecase;
  HomeScreenBloc(this.getTransactionsUsecase)
      : super(HomeScreenState.initial()) {
    on<HomeScreenEvent>((event, emit) async {
      final resp = await getTransactionsUsecase(
          DateParams(fromDate: event.fromDate, toDate: event.toDate));
      final newState = resp.fold((fail) {
        return state
            .copyWith(isLoading: false, error: fail.error, transactionList: []);
      }, (data) {
        return state.copyWith(
            isLoading: false, error: null, transactionList: data);
      });
      emit(newState);
    });
  }
}
