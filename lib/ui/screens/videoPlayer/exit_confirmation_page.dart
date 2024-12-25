import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'dart:math';

import 'package:kids_app/ui/components/otp_component.dart';

class ExitConfirmationPage extends StatefulWidget {
  const ExitConfirmationPage({Key? key}) : super(key: key);

  @override
  _ExitConfirmationPageState createState() => _ExitConfirmationPageState();
}

class _ExitConfirmationPageState extends State<ExitConfirmationPage> {
  late String _exitpassword;
  late String _passwordInWords;

  String enteredPasswordList = "";

  @override
  void initState() {
    super.initState();
    _exitpassword = _generateRandomPassword();
    _passwordInWords =
        _convertNumberToWords(_exitpassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            "Ebeveyn Kontrolu",
            style: AppTheme.generalMenuTitle,
          ),
          const SizedBox(height: 16),
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.8,
            child: Container(
              height: 2.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              "Lütfen sırasıyla aşağıda verilen sayıları girin",
              textAlign: TextAlign.center,
              style: AppTheme.primaryButtonText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _passwordInWords,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 32),
          OtpInputComponent(
            onOtpChanged: (otp) {
              setState(() {
                enteredPasswordList = otp;
                _checkPassword();
              });
            },
          ),
        ],
      ),
    );
  }

  String _generateRandomPassword() {
    Random random = Random();
    int password = random.nextInt(90000) + 10000;
    return password.toString();
  }

  String _convertNumberToWords(String number) {
    Map<String, String> numberToWords = {
      '0': 'Sıfır',
      '1': 'Bir',
      '2': 'İki',
      '3': 'Üç',
      '4': 'Dört',
      '5': 'Beş',
      '6': 'Altı',
      '7': 'Yedi',
      '8': 'Sekiz',
      '9': 'Dokuz'
    };

    List<String> words =
        number.split('').map((digit) => numberToWords[digit] ?? '').toList();
    return words.join(' - ');
  }

  void _checkPassword() {
    if (enteredPasswordList.isNotEmpty) {
      String enteredPassword =
          enteredPasswordList;
      if (enteredPassword == _exitpassword) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } else if (enteredPassword.length == _exitpassword.length) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Hata'),
              content: const Text('Girilen şifre yanlış!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tamam'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
