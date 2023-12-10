import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/features/authentication/presentation/authentication_bloc/authentication_bloc.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthenticationBloc>().add(GoogleSignIn());
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content:
                      BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      if (state.isLoginSuccess) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => HomeScreen()));
                      }
                    },
                    child: Center(
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                          color: AppTheme.blueColor, size: 70),
                    ),
                  ),
                );
              });
        },
        child: Text("Continue with google"),
      ),
    ));
  }
}
