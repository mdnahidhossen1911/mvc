import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc/core/extensions/space_gap.dart';

import 'app_text.dart';
import 'app_text_field.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool enabled;
  final int? maxLines;
  final bool? isRed;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? fontSize;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;


  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.enabled = true,
    this.maxLines,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.fontSize,
    this.isRed,
    this.inputFormatters,
    this.validator, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          fontSize: fontSize ?? 14,
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w500,
        ),
        8.hGap,
        AppTextField(
          key: key,
          inputFormatters: inputFormatters,
          isRead: isRed,
          controller: controller,
          hintText: hintText,
          maxLines: maxLines ?? 1,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          validator: validator,
          onChanged: onChanged,
          enabled: enabled,
        ),
      ],
    );
  }
}
