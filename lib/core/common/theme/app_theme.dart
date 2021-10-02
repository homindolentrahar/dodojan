import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:dodojan/core/common/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      canvasColor: AppColor.white,
      primaryColor: AppColor.primary,
      fontFamily: "Poppins",
      textTheme: AppTypography.getTypography(),
    );
  }
}
