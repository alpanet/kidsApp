import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        // No need for 'const' here
        headlineLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Gentona',
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'Gentona',
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

  static TextStyle get onboardingTitle => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
        fontFamily: 'Gentona',
      );

  static TextStyle get onboardingSubTitle => const TextStyle(
        fontSize: 18,
        color: primaryTextColor,
        fontFamily: 'Gentona',
      );

  static TextStyle get primaryButtonText => const TextStyle(
        fontSize: 23,
        color: primaryTextColor,
        fontWeight: FontWeight.normal,
        fontFamily: 'Gentona',
      );

  static TextStyle get secondaryButtonText => const TextStyle(
        fontSize: 23,
        color: secondTextColor,
        fontWeight: FontWeight.normal,
        fontFamily: 'Gentona',
      );

  static TextStyle get generalTitle => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: secondTextColor,
        fontFamily: 'Gentona',
      );

  static TextStyle get generalMenuTitle => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
        fontFamily: 'Gentona',
      );
  
  static TextStyle get mainpageTitle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: secondTextColor,
        fontFamily: 'Gentona',
      );

  static TextStyle get mainpageSubTitle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: secondTextColor,
        fontFamily: 'Gentona',
      );
  
  static TextStyle get mainpageCategoryTitle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: secondTextColor,
        fontFamily: 'Gentona',
      );
}
