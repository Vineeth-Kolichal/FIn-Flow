part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required bool isLoginSuccess,
    required String? err,
    required String? logoutSmsg,
    required String? logoutFmsg,
  }) = _Initial;
  factory AuthenticationState.inital() => const AuthenticationState(
      isLoginSuccess: false, err: null, logoutFmsg: null, logoutSmsg: null);
}
