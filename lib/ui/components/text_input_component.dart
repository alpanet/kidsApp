import 'package:flutter/material.dart';
import 'package:kids_app/ui/constants/colors.dart';

class TextInputComponent extends StatelessWidget {
  final String? label;
  final String placeholder;
  final TextEditingController? controller;
  final bool isMultiline;
  final bool enabled;
  final Function(String)? onChanged;
  final InputBorder border;

  const TextInputComponent({
    super.key,
    this.label,
    required this.placeholder,
    this.controller,
    this.isMultiline = false,
    this.enabled = true,
    this.onChanged,
    this.border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
        ],

        // TextField with Icons
        TextField(
          controller: controller,
          maxLines: isMultiline ? null : 1,
          enabled: enabled,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            filled: true,
            fillColor: greyColor,
            focusedBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.grey, width: 0.1),
            ),
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
