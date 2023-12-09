import 'dart:async';

import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const HomeScreen()));
      });
    });
    return Scaffold(
      body: Center(
        child: Text("FinFlow"),
      ),
    );
  }
}
