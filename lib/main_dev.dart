import 'package:fin_flow/core/dependancy_injection/config/service_locator.dart';
import 'package:fin_flow/firebase_options_dev.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'fin_flow_app.dart';

Future<void> main() async {
  print('Dev');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureInjection();
  runApp(const FinFlowApp());
}
