import 'package:fin_flow/core/dependancy_injection/config/service_locator.dart';

import 'package:fin_flow/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'fin_flow_app.dart';

ValueNotifier<bool> isDark = ValueNotifier(false);
Future<void> main() async {
  print('prod');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureInjection();
  runApp(const FinFlowApp());
}
