import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterGathering extends StatelessWidget {
  const RegisterGathering({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return Container(
      decoration:
          const BoxDecoration(color: AppTheme.primaryBackgoundColor),
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
              'Hesap Oluşturma',
              style: AppTheme.generalTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Hesap oluşturmak için telefon numaranızı girin. Hesap bilgilerini düzenlemek için daha sonra Ayarlar sekmesinden devam edebilirsiniz ',
              style: AppTheme.onboardingSubTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment
                    .bottomCenter, // Ortada hizalamak için bottomCenter kullanıyoruz
                child: IntlPhoneField(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
