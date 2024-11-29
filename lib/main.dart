import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const OnboardingScreen(),
    );
  }
}


