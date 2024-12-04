import 'package:auto_route/auto_route.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/button_component.dart';
import 'package:kids_app/ui/components/countdown_component.dart';
import 'package:kids_app/ui/components/otp_component.dart';

@RoutePage()
class RegisterOtp extends StatefulWidget {
  const RegisterOtp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterOtpState createState() => _RegisterOtpState();
}

class _RegisterOtpState extends State<RegisterOtp> {
  bool _isButtonEnabled = false;
  late CountDownController _countdownController;
  List<String> _otpList = List<String>.generate(5, (index) => "");

  @override
  void initState() {
    super.initState();
    _countdownController = CountDownController();
  }

  void _onTimerComplete() {
    setState(() {
      _isButtonEnabled = true;
    });
  }

  void _onResendPressed() {
    setState(() {
      _isButtonEnabled = false;
      _otpList = List<String>.generate(5, (index) => "");
    });
    _countdownController.restart(duration: 10);
  }

  void _onProceedPressed() {
    String otp = _otpList.join('');
    print('OTP Entered: $otp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackgoundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Center(
              child: Text(
                'Hesap Doğrulama',
                style: AppTheme.generalTitle,
                textAlign: TextAlign.center,
              ),
            ),
            CountdownComponent(
              controller: _countdownController,
              onCompleteCallback: _onTimerComplete,
            ),
            OtpInputComponent(
              otpList: _otpList,
              onOtpChanged: (otp) {
                setState(() {
                  _otpList = otp;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonComponent(
                text: "Tekrar Gönder",
                enabled: _isButtonEnabled,
                onPressed: _isButtonEnabled ? _onResendPressed : null,
              ),
              const SizedBox(height: 10),
              ButtonComponent(
                text: "İleri",
                onPressed: () {
                  context.router.replaceNamed('mainpage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
