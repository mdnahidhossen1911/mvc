import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../core/theme/app_colors.dart';
import 'app_text.dart';

class ButtonWithLoading extends StatelessWidget {
  const ButtonWithLoading({
    super.key,
    required this.onTap,
    required this.title,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.color,
    this.fontSize = 16,
    this.height = 48,
    this.splashColor,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String title;
  final bool isLoading;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? splashColor;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);

    return Material(
      borderRadius: radius,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: radius,
        splashColor: splashColor ?? AppColors.primaryColor,
        child: Ink(
          height: height,
          decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor,
            borderRadius: radius,
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),
          child: isLoading
              ? Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.white,
              size: 28,
            ),
          )
              : Center(
            child: AppText(
              title,
              color: textColor ?? Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
