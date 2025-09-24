import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const primaryColor = Color(0xFF5436F8);
  static const secondaryColor = Color(0xFF18153F);
  static const backgroundColor = Color(0xFFDDE2FF);
  static const detailsBackgroundColor = Color(0xFF2C1E51);

  // Gradient background using backgroundColor and its transparent version
  static final LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,

    colors: [backgroundColor, Colors.white],
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    fontFamily: GoogleFonts.raleway().fontFamily,

    // Apply Raleway font to all text throughout the app
    textTheme: GoogleFonts.ralewayTextTheme().apply(
      bodyColor: secondaryColor,
      displayColor: secondaryColor,
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: secondaryColor,
      titleTextStyle: GoogleFonts.raleway(
        color: secondaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
