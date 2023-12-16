import 'dart:async';

import 'package:fin_flow/features/authentication/presentation/pages/login_screen.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:fin_flow/features/splash/presentation/cubit/splash_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SplashScreenCubit>().isLoggedIn();
    });
    return BlocListener<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        if (state.isLoaggedIn == true) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const HomeScreen()));
        }
        if (state.isLoaggedIn == false) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const LoginScreen()));
        }
      },
      child: Scaffold(
        body: Center(
          child: Hero(
              tag: 'logo',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/fin_flow_icon.png',
                  height: 120,
                ),
              )),
        ),
      ),
    );
  }
}
