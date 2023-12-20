import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinFlowTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: scaffoldBgLight,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blackColor,
        textStyle: const TextStyle(
          color: whiteColor,
        ),
      ),
    ),
    textTheme: lightTextTheme,
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: scaffoldBgDark,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: whiteColor,
          textStyle: const TextStyle(
            color: blackColor,
          )),
    ),
    textTheme: darkTextTheme,
  );

  //TextTheme
  static TextTheme darkTextTheme = const TextTheme(
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: blackColor,
    ),
  );
  static TextTheme lightTextTheme = const TextTheme(
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: blackColor,
    ),
  );
//Colors
  static const Color scaffoldBgLight = Color.fromARGB(255, 247, 246, 246);
  static const Color scaffoldBgDark = Color.fromARGB(255, 34, 34, 34);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static const Color blueColor = Colors.blue;
  static const Color greenColor = Colors.green;
  static const Color redColor = Colors.red;
  static const Color darkGrey = Color.fromARGB(255, 107, 107, 107);
}
