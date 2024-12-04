import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';

class OnboardingPage4 extends StatelessWidget {
  final int currentPage;
  final PageController pageController;

  const OnboardingPage4(
      {super.key, required this.currentPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration:
          const BoxDecoration(color: AppTheme.onboardingPageFourColorEnd),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 90.0),
            ),
            Text(
              'Çocuğunuz İçin En İyi Deneyim',
              style: AppTheme.onboardingTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Uygulama, çocuğunuz için en uygun ve güvenli eğlenceyi sunmak için tasarlandı.',
              style: AppTheme.onboardingSubTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Center(
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenWidth * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/onboarding_images/onboarding_four.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment
                    .bottomCenter, // Ortada hizalamak için bottomCenter kullanıyoruz
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, // Şeffaf arka plan
                      shape:
                          BoxShape.rectangle, // Yuvarlak şekil için gerekirse
                      border: Border.all(
                        color: Colors.white, // Beyaz border
                        width: 2.0, // Border kalınlığı
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const RegisterGathering(),
                      //   ),
                      // );
                      context.router.replaceNamed('register');
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 8.0,
                      ),
                      backgroundColor: Colors.transparent, // Arka plan rengi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Başlayalım",
                      style: AppTheme.primaryButtonText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
