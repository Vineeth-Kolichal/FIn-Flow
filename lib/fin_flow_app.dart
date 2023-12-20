import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependancy_injection/config/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'features/authentication/presentation/authentication_bloc/authentication_bloc.dart';
import 'features/home/presentation/bloc_and_cubits/add_transaction_sheet_cubit/add_transaction_sheet_cubit.dart';
import 'features/home/presentation/bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart';
import 'features/splash/presentation/cubit/splash_screen_cubit.dart';
import 'features/splash/presentation/pages/splash_screen.dart';

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
        themeMode: ThemeMode.dark,
        theme: FinFlowTheme.light,
        darkTheme: FinFlowTheme.dark,
        home: SplashScreen(),
      ),
    );
  }
}
