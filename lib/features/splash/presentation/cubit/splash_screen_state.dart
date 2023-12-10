part of 'splash_screen_cubit.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState({required bool? isLoaggedIn}) = _Initial;
  factory SplashScreenState.initial() =>
      const SplashScreenState(isLoaggedIn: null);
}
