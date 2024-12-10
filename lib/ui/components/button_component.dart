import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final TextStyle? textStyle;
  final double borderRadius;
  final bool enabled;

  const ButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF6F853E),
    this.textStyle,
    this.borderRadius = 8.0,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? color : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(
        text,
        style: textStyle ??
            const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
    );
  }
}
