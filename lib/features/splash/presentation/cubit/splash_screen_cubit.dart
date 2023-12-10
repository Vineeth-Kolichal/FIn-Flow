import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_state.dart';
part 'splash_screen_cubit.freezed.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState.initial());
  void isLoggedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    Timer(const Duration(seconds: 3), () {
      if (user == null) {
        emit(state.copyWith(isLoaggedIn: false));
      } else {
        emit(state.copyWith(isLoaggedIn: true));
      }
    });
  }
}
