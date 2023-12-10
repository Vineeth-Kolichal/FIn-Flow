part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required bool isLoginSuccess,
    required String? err,
  }) = _Initial;
  factory AuthenticationState.inital() =>
      AuthenticationState(isLoginSuccess: false, err: null);
}
