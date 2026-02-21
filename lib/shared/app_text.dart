import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;

  // Text behavior
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Locale? locale;

  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final Paint? foreground;
  final Paint? background;
  final Locale? textLocale;
  final List<Shadow>? shadows;

  const AppText(
      this.data, {
        super.key,
        this.textAlign,
        this.textDirection,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.locale,

        // Style
        this.color,
        this.fontSize,
        this.fontWeight,
        this.fontStyle,
        this.letterSpacing,
        this.wordSpacing,
        this.height,
        this.decoration,
        this.decorationColor,
        this.decorationStyle,
        this.decorationThickness,
        this.fontFamily,
        this.fontFamilyFallback,
        this.foreground,
        this.background,
        this.textLocale,
        this.shadows,
      });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      foreground: foreground,
      background: background,
      locale: textLocale,
      shadows: shadows,
    );

    return Text(
      data,
      style: textStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      locale: locale,
    );
  }
}
