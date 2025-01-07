import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.nunito(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.nunito(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  static const Color onboardingPageOneColorStart = Color(0xFFCB7B1E);
  static const Color onboardingPageOneColorEnd = Color(0xFFFFCC90);
  static const Color onboardingPageTwoColorStart = Color(0xFF272602);
  static const Color onboardingPageTwoColorEnd = Color(0xFFFAE7D1);
  static const Color onboardingPageTreeColorStart = Color(0xFFA5B9FE);
  static const Color onboardingPageTreeColorEnd = Color(0x00000000);
  static const Color onboardingPageFourColorStart =
      Color.fromARGB(0, 255, 0, 0);
  static const Color onboardingPageFourColorEnd = Color(0xFFFEA5A5);

  static const Color primaryBackgoundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondBackgoundColor = Color(0xFF6F853E);

  static const Color primaryTextColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondTextColor = Color.fromARGB(255, 0, 0, 0);

  static TextStyle get onboardingTitle => GoogleFonts.nunito(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      );

  static TextStyle get onboardingSubTitle => GoogleFonts.nunito(
        fontSize: 18,
        color: primaryTextColor,
      );

  static TextStyle get primaryButtonText => GoogleFonts.nunito(
        fontSize: 23,
        color: primaryTextColor,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get secondaryButtonText => GoogleFonts.nunito(
        fontSize: 23,
        color: secondTextColor,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get generalTitle => GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: secondTextColor,
      );

  static TextStyle get generalMenuTitle => GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      );

  static TextStyle get mainpageTitle => GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: secondTextColor,
      );

  static TextStyle get mainpageSubTitle => GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: secondTextColor,
      );

  static TextStyle get mainpageCategoryTitle => GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: secondTextColor,
      );

  static TextStyle get settingsTitle => GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: secondTextColor,
      );

  static TextStyle get snackBarContent => GoogleFonts.nunito(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: const Color.fromARGB(255, 255, 255, 255),
      );

  static TextStyle get watchPageCardTitle => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: secondTextColor,
      );
}
