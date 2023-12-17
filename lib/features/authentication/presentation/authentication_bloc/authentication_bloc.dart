import 'package:bloc/bloc.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:fin_flow/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LogoutUseCase logoutUseCase;
  final AuthUseCase authUseCase;
  AuthenticationBloc(this.authUseCase, this.logoutUseCase)
      : super(AuthenticationState.inital()) {
    on<GoogleSignIn>((event, emit) async {
      await authUseCase(NoParams()).then((value) {
        value.fold((fail) {
          emit(state.copyWith(
              isLoginSuccess: false,
              err: fail.error,
              logoutFmsg: null,
              logoutSmsg: null));
        }, (success) {
          emit(state.copyWith(
              isLoginSuccess: true,
              err: null,
              logoutFmsg: null,
              logoutSmsg: null));
        });
      });
    });
    on<Logout>((event, emit) async {
      await logoutUseCase(NoParams()).then((value) {
        value.fold((fail) {
          emit(state.copyWith(
              isLoginSuccess: false,
              err: null,
              logoutFmsg: fail.error,
              logoutSmsg: null));
        }, (msg) {
          emit(state.copyWith(
              isLoginSuccess: false,
              err: null,
              logoutFmsg: null,
              logoutSmsg: msg));
        });
      });
    });
  }
}
