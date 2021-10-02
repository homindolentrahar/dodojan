import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:ionicons/ionicons.dart';

class AppSnackbars {
  static GetBar errorSnackbar({
    required String title,
    required String message,
  }) =>
      GetBar(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: const EdgeInsets.all(16),
        barBlur: 0,
        backgroundColor: AppColor.black,
        borderRadius: 8,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 500),
        forwardAnimationCurve: Curves.easeInQuint,
        reverseAnimationCurve: Curves.easeOutQuint,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(Ionicons.alert_circle_outline, color: AppColor.red),
        titleText: Text(
          title,
          style: Get.textTheme.headline3?.copyWith(color: AppColor.white),
        ),
        messageText: Text(
          message,
          style: Get.textTheme.bodyText2?.copyWith(color: AppColor.light),
        ),
      );

  static GetBar successSnackbar({
    required String title,
    required String message,
  }) =>
      GetBar(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: const EdgeInsets.all(16),
        barBlur: 0,
        backgroundColor: AppColor.black,
        borderRadius: 8,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 500),
        forwardAnimationCurve: Curves.easeInQuint,
        reverseAnimationCurve: Curves.easeOutQuint,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(Ionicons.alert, color: AppColor.green),
        titleText: Text(
          title,
          style: Get.textTheme.headline3?.copyWith(color: AppColor.white),
        ),
        messageText: Text(
          message,
          style: Get.textTheme.bodyText2?.copyWith(color: AppColor.light),
        ),
      );
}
