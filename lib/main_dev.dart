import 'package:fin_flow/core/dependancy_injection/config/service_locator.dart';
import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/features/authentication/presentation/authentication_bloc/authentication_bloc.dart';
import 'package:fin_flow/features/authentication/presentation/pages/login_screen.dart';
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/add_transaction_sheet_cubit/add_transaction_sheet_cubit.dart';
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:fin_flow/features/splash/presentation/cubit/splash_screen_cubit.dart';
import 'package:fin_flow/features/splash/presentation/pages/splash_screen.dart';
import 'package:fin_flow/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureInjection();
  runApp(const FinFlowApp());
}

class FinFlowApp extends StatelessWidget {
  const FinFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AddTransactionSheetCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthenticationBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeScreenBloc>(),
        ),
        BlocProvider(
          create: (context) => SplashScreenCubit(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        home: SplashScreen(),
      ),
    );
  }
}
