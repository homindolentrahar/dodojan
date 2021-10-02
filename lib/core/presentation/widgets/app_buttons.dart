import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      minWidth: Get.width,
      height: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Get.theme.primaryColor,
      splashColor: AppColor.black.withOpacity(0.15),
      highlightColor: AppColor.black.withOpacity(0.3),
      child: Text(
        text,
        style: Get.textTheme.button?.copyWith(color: AppColor.white),
      ),
      onPressed: onPressed,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      minWidth: Get.width,
      height: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: AppColor.primaryOpacity,
      splashColor: Get.theme.primaryColor.withOpacity(0.15),
      highlightColor: Get.theme.primaryColor.withOpacity(0.3),
      child: Text(
        text,
        style: Get.textTheme.button?.copyWith(color: Get.theme.primaryColor),
      ),
      onPressed: onPressed,
    );
  }
}

class AppBackButton extends StatelessWidget {
  final VoidCallback? additionalAction;

  const AppBackButton({
    Key? key,
    this.additionalAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      minWidth: 0,
      height: 0,
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: AppColor.primaryOpacity,
      splashColor: Get.theme.primaryColor.withOpacity(0.15),
      highlightColor: Get.theme.primaryColor.withOpacity(0.3),
      child: Icon(
        Ionicons.arrow_back,
        color: Get.theme.primaryColor,
        size: 16,
      ),
      onPressed: () {
        additionalAction?.call();

        Get.back();
      },
    );
  }
}

class ProceedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProceedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      minWidth: 0,
      height: 0,
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: AppColor.primaryOpacity,
      splashColor: Get.theme.primaryColor.withOpacity(0.15),
      highlightColor: Get.theme.primaryColor.withOpacity(0.3),
      child: Icon(
        Ionicons.arrow_forward,
        color: Get.theme.primaryColor,
        size: 16,
      ),
      onPressed: onPressed,
    );
  }
}

class AppCloseButton extends StatelessWidget {
  final VoidCallback? additionalAction;

  const AppCloseButton({
    Key? key,
    this.additionalAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      minWidth: 0,
      height: 0,
      padding: const EdgeInsets.all(8),
      shape: const CircleBorder(),
      color: AppColor.light,
      splashColor: AppColor.grey.withOpacity(0.15),
      highlightColor: AppColor.grey.withOpacity(0.3),
      child: const Icon(
        Ionicons.close,
        color: AppColor.grey,
        size: 16,
      ),
      onPressed: () {
        additionalAction?.call();

        Get.back();
      },
    );
  }
}

class AppDoneButton extends StatelessWidget {
  final VoidCallback? additionalAction;

  const AppDoneButton({
    Key? key,
    this.additionalAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      minWidth: 0,
      height: 0,
      padding: const EdgeInsets.all(8),
      shape: const CircleBorder(),
      color: AppColor.primaryOpacity,
      splashColor: Get.theme.primaryColor.withOpacity(0.15),
      highlightColor: Get.theme.primaryColor.withOpacity(0.3),
      child: Icon(
        Ionicons.checkmark,
        color: Get.theme.primaryColor,
        size: 16,
      ),
      onPressed: () {
        additionalAction?.call();

        Get.back();
      },
    );
  }
}
