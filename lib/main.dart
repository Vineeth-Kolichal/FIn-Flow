import 'dart:ui';

import 'package:fin_flow/core/dependancy_injection/config/service_locator.dart';

import 'package:fin_flow/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fin_flow_app.dart';

late ValueNotifier<bool> isDark;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Brightness brightness = PlatformDispatcher.instance.platformBrightness;
  SharedPreferences shared = await SharedPreferences.getInstance();
  bool? isDarkTheme = shared.getBool('theme');
  if (isDarkTheme != null) {
    isDark = ValueNotifier(isDarkTheme);
  } else {
    isDark = ValueNotifier(brightness == Brightness.dark);
  }
  await configureInjection();
  runApp(const FinFlowApp());
}
