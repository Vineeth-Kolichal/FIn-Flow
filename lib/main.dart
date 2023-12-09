import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/cubit/add_transaction_sheet_cubit.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FinFlowApp());
}

class FinFlowApp extends StatelessWidget {
  const FinFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddTransactionSheetCubit(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
    
      child: MaterialApp(
        theme: AppTheme.theme,
        home: HomeScreen(),
      ),
    );
  }
}
