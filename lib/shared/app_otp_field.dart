import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AppOtpField extends StatelessWidget {
  const AppOtpField({
    super.key,
    required this.controller,
    this.validator,
    this.length = 6,
    this.pinSize = const Size(60, 50),
    this.borderRadius = 30,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.textStyle,
    this.onCompleted,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int length;
  final Size pinSize;
  final double borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final TextStyle? textStyle;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor =
        borderColor ?? Colors.black.withOpacity(.1);
    final effectiveFocusedColor =
        focusedBorderColor ?? Theme.of(context).primaryColor;
    final effectiveErrorColor =
        errorBorderColor ?? Theme.of(context).colorScheme.error;

    final defaultTheme = _buildTheme(
      borderColor: effectiveBorderColor,
      textStyle: textStyle,
    );

    return Pinput(
      length: length,
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.number,
      defaultPinTheme: defaultTheme,
      focusedPinTheme: _buildTheme(
        borderColor: effectiveFocusedColor,
        textStyle: textStyle,
        borderWidth: 1.5,
      ),
      errorPinTheme: _buildTheme(
        borderColor: effectiveErrorColor,
        textStyle: textStyle,
      ),
      onCompleted: onCompleted,
      onChanged: onChanged,
    );
  }

  PinTheme _buildTheme({
    required Color borderColor,
    TextStyle? textStyle,
    double borderWidth = 1.0,
  }) {
    return PinTheme(
      width: pinSize.width,
      height: pinSize.height,
      textStyle: textStyle ??
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}