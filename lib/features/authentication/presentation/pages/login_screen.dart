import 'package:fin_flow/common/widgets/export_common_widgets.dart';
import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/features/authentication/presentation/authentication_bloc/authentication_bloc.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                theme.brightness == Brightness.light
                    ? 'assets/images/fin_flow_logo.png'
                    : 'assets/images/fin_flow_logo_inverted.png',
                height: 60,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(const GoogleSignIn());
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: BlocListener<AuthenticationBloc,
                            AuthenticationState>(
                          listener: (context, state) {
                            if (state.isLoginSuccess) {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => const HomeScreen()));
                            }
                            if (state.err != null) {
                              Fluttertoast.showToast(
                                msg: "${state.err}",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: FinFlowTheme.blackColor,
                                textColor: FinFlowTheme.whiteColor,
                                fontSize: 12.0,
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          child: Center(
                            child:
                                LoadingAnimationWidget.horizontalRotatingDots(
                                    color: FinFlowTheme.blueColor, size: 70),
                          ),
                        ),
                      );
                    });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/google.png',
                    height: 20,
                  ),
                  Space.x(10),
                  Text(
                    "Continue with Google",
                    style: theme.textTheme.labelMedium,
                    //style: txt14WhiteB,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
