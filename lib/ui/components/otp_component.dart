import 'package:flutter/material.dart';

class OtpInputComponent extends StatefulWidget {
  final List<String> otpList;
  final ValueChanged<List<String>> onOtpChanged;

  const OtpInputComponent({
    super.key,
    required this.otpList,
    required this.onOtpChanged,
  });

  @override
  _OtpInputComponentState createState() => _OtpInputComponentState();
}

class _OtpInputComponentState extends State<OtpInputComponent> {
  final _focusNodes = List.generate(5, (index) => FocusNode());

  @override
  void dispose() {
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
            controller: TextEditingController(text: widget.otpList[index]),
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) {
              widget.otpList[index] =
                  value; // Update OTP list when input changes
              widget.onOtpChanged(
                  widget.otpList); // Notify parent to update the list

              // Move to the next field if the current field is filled
              if (value.isNotEmpty && index < 4) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              }
              // Move to the previous field if the user deletes the value
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}
