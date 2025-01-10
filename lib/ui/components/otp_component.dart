import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';

class OtpInputComponent extends StatefulWidget {
  final ValueChanged<String> onOtpChanged;

  const OtpInputComponent({
    super.key,
    required this.onOtpChanged,
  });

  @override
  _OtpInputComponentState createState() => _OtpInputComponentState();
}

class _OtpInputComponentState extends State<OtpInputComponent> {
  final _focusNodes = List.generate(5, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(5, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 50,
          height: 60,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppTheme.fourthBackgoundColor),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 4) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
              String otp = _controllers.map((controller) => controller.text).join('');
              widget.onOtpChanged(otp);
            },
          ),
        );
      }),
    );
  }
}
