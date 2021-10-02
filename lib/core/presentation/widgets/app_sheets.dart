import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:dodojan/core/presentation/widgets/app_buttons.dart';
import 'package:dodojan/core/presentation/widgets/app_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class FieldSheet extends StatelessWidget {
  final String hint;
  final String name;
  final TextInputType? keyboardType;
  final TextInputAction? action;
  final String? Function(String?)? validators;
  final ValueChanged<String?> onChanged;
  final bool enableSave;
  final VoidCallback onSaved;

  const FieldSheet({
    Key? key,
    required this.hint,
    required this.name,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.done,
    required this.validators,
    required this.onChanged,
    this.enableSave = false,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppCloseButton(),
              enableSave ? const AppDoneButton() : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 16),
          FilledTextField(
            name: name,
            hint: hint,
            keyboardType: keyboardType,
            action: action,
            validators: validators,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class ImagePickerSheet extends StatelessWidget {
  final VoidCallback pickImage;
  final VoidCallback capturePhoto;
  final bool enableSave;
  final VoidCallback onSaved;

  const ImagePickerSheet({
    Key? key,
    required this.pickImage,
    required this.capturePhoto,
    this.enableSave = false,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppCloseButton(),
                  const SizedBox(width: 8),
                  Text(
                    "Foto Profil",
                    style: Get.textTheme.headline5,
                  ),
                ],
              ),
              enableSave ? const AppDoneButton() : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ImagePickerSheetAction(
                icon: Ionicons.camera,
                iconColor: Get.theme.primaryColor,
                backgroundColor: AppColor.primaryOpacity,
                title: Text(
                  "Foto",
                  style: Get.textTheme.bodyText2,
                ),
                onTap: () {},
              ),
              const SizedBox(width: 32),
              ImagePickerSheetAction(
                icon: Ionicons.image,
                iconColor: Get.theme.primaryColor,
                backgroundColor: AppColor.primaryOpacity,
                title: Text(
                  "Gambar",
                  style: Get.textTheme.bodyText2,
                ),
                onTap: () {},
              ),
              const SizedBox(width: 32),
              ImagePickerSheetAction(
                icon: Ionicons.trash,
                iconColor: AppColor.red,
                backgroundColor: AppColor.redOpacity,
                title: Text(
                  "Hapus",
                  style: Get.textTheme.headline5?.copyWith(
                    color: AppColor.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ).paddingAll(16),
        ],
      ),
    );
  }
}

class ImagePickerSheetAction extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Text title;
  final VoidCallback onTap;

  const ImagePickerSheetAction({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 8),
          title,
        ],
      ),
    );
  }
}
