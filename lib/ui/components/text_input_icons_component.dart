import 'package:flutter/material.dart';

class TextInputIconsComponent extends StatefulWidget {
  final String? label;
  final String placeholder;
  final TextEditingController? controller;
  final bool isMultiline;
  final bool enabled;
  final Function(String)? onChanged;
  final IconData initialLeadingIcon;
  final IconData alternateLeadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingIconPressed;
  final InputBorder border;

  const TextInputIconsComponent({
    super.key,
    this.label,
    required this.placeholder,
    this.controller,
    this.isMultiline = false,
    this.enabled = true,
    this.onChanged,
    required this.initialLeadingIcon,
    required this.alternateLeadingIcon,
    this.trailingIcon,
    this.onTrailingIconPressed,
    this.border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1),
    ),
  });

  @override
  _TextInputComponentState createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputIconsComponent> {
  late IconData _currentLeadingIcon;

  @override
  void initState() {
    super.initState();
    _currentLeadingIcon = widget.initialLeadingIcon;
  }

  void _toggleLeadingIcon() {
    setState(() {
      _currentLeadingIcon = _currentLeadingIcon == widget.initialLeadingIcon
          ? widget.alternateLeadingIcon
          : widget.initialLeadingIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
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
          controller: widget.controller,
          maxLines: widget.isMultiline ? null : 1,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            filled: true,
            fillColor: Colors.grey[200],
            focusedBorder: widget.border.copyWith(
              borderSide: const BorderSide(color: Colors.grey, width: 0.1),
            ),
            prefixIcon: IconButton(
              icon: Icon(_currentLeadingIcon, color: Colors.black),
              onPressed: _toggleLeadingIcon,
            ),
            suffixIcon: widget.trailingIcon != null
                ? IconButton(
                    icon: Icon(widget.trailingIcon, color: Colors.black),
                    onPressed: widget.onTrailingIconPressed,
                  )
                : null,
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
