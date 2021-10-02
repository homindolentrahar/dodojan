import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static TextTheme getTypography() {
    const primarySurface = AppColor.black;
    final secondarySurface = AppColor.black.withOpacity(0.5);

    return TextTheme(
      headline1: const TextStyle(
        color: primarySurface,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headline2: const TextStyle(
        color: primarySurface,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headline3: const TextStyle(
        color: primarySurface,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headline4: const TextStyle(
        color: primarySurface,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      headline5: const TextStyle(
        color: primarySurface,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        color: secondarySurface,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        color: secondarySurface,
        fontSize: 12,
      ),
      caption: const TextStyle(
        color: primarySurface,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      button: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
