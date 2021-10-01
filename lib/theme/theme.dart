import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgetbook_test/theme/colors.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    textTheme: GoogleFonts.ralewayTextTheme(),
    primaryColor: CustomColors.beige,
    scaffoldBackgroundColor: CustomColors.beige,
    backgroundColor: Colors.black.withOpacity(0.05),
    primarySwatch: Colors.blue,
    dividerColor: Colors.black,
    errorColor: CustomColors.red,
    accentColor: Colors.green,
    hintColor: CustomColors.green.withOpacity(0.35),
  );
  static ThemeData dark = ThemeData(
    textTheme: GoogleFonts.ralewayTextTheme(),
    primaryColor: Colors.black54,
    scaffoldBackgroundColor: Colors.black54,
    backgroundColor: Colors.black.withOpacity(0.25),
    primarySwatch: Colors.blue,
    dividerColor: Colors.black,
    errorColor: CustomColors.red,
    accentColor: Colors.green,
    hintColor: CustomColors.green.withOpacity(0.35),
  );
}
