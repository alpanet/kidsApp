import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kids_app/ui/components/button_component.dart';

@RoutePage()
class RegisterGathering extends StatelessWidget {
  const RegisterGathering({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return Scaffold(
      backgroundColor: AppTheme.primaryBackgoundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 90),
            Text(
              'Hesap Oluşturma',
              style: AppTheme.generalTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Hesap oluşturmak için telefon numaranızı girin. Hesap bilgilerini düzenlemek için daha sonra Ayarlar sekmesinden devam edebilirsiniz ',
              style: AppTheme.onboardingSubTitle
                  .copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            IntlPhoneField(
              focusNode: focusNode,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              languageCode: "en",
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: AppTheme.onboardingSubTitle.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                ),
                children: [
                  const TextSpan(
                    text: 'Bilgiler ile devam ederseniz ',
                  ),
                  TextSpan(
                    text: 'Kullanıcı sözleşmesini',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Kullanıcı sözleşmesini clicked');
                      },
                  ),
                  const TextSpan(
                    text: ' kabul etmiş sayılırsınız.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: ButtonComponent(
          text: "İleri",
          onPressed: () {
            context.router.replaceNamed('registerOtp');
          },
        ),
      ),
    );
  }
}
