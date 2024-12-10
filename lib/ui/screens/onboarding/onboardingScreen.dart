import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';
import 'onboarding_page4.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                OnboardingPage1(
                    currentPage: _currentPage, pageController: _pageController),
                OnboardingPage2(
                    currentPage: _currentPage, pageController: _pageController),
                OnboardingPage3(
                    currentPage: _currentPage, pageController: _pageController),
                OnboardingPage4(
                    currentPage: _currentPage, pageController: _pageController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
