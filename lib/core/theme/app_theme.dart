import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinFlowTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: scaffoldBgLight,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    canvasColor: whiteColor,
    radioTheme:
        RadioThemeData(fillColor: MaterialStateProperty.all<Color>(darkGrey2)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blackColor,
        textStyle: const TextStyle(
          color: whiteColor,
        ),
      ),
    ),
    textTheme: getTextTheme(false),
    buttonTheme: const ButtonThemeData(
      buttonColor: blackColor,
    ),
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: scaffoldBgDark,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    canvasColor: blackColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: whiteColor,
          textStyle: const TextStyle(
            color: blackColor,
          )),
    ),
    textTheme: getTextTheme(true),
    buttonTheme: const ButtonThemeData(buttonColor: whiteColor),
  );

  //TextTheme

  static TextTheme getTextTheme(bool isDark) {
    return TextTheme(
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: isDark ? blackColor : whiteColor,
      ),
    );
  }

//Colors
  static const Color scaffoldBgLight = Color.fromARGB(255, 247, 246, 246);
  static const Color scaffoldBgDark = Color.fromARGB(255, 19, 18, 18);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color darkGrey2 = Color.fromARGB(255, 32, 32, 32);
  static const Color greyColor = Colors.grey;
  static const Color blueColor = Colors.blue;
  static const Color greenColor = Colors.green;
  static const Color redColor = Colors.red;
  static const Color darkGrey = Color.fromARGB(255, 107, 107, 107);
  final a = Color(0xFFF3F3F3);
}
