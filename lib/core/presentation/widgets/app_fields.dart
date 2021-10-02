import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UnderlineTextField extends StatelessWidget {
  final String name;
  final String hint;
  final TextInputType? keyboardType;
  final TextInputAction? action;
  final String? Function(String?)? validators;
  final ValueChanged<String?>? onChanged;

  const UnderlineTextField({
    Key? key,
    required this.name,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.done,
    required this.validators,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      keyboardType: keyboardType,
      textInputAction: action,
      cursorColor: Get.theme.primaryColor,
      style: Get.textTheme.bodyText2?.copyWith(
        color: AppColor.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: hint,
        hintStyle: Get.textTheme.bodyText2?.copyWith(
          color: AppColor.grey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.light,
            width: 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Get.theme.primaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.red,
            width: 1.5,
          ),
        ),
      ),
      validator: validators,
      onChanged: onChanged,
    );
  }
}

class FilledTextField extends StatelessWidget {
  final String name;
  final String hint;
  final TextInputType? keyboardType;
  final TextInputAction? action;
  final String? Function(String?)? validators;
  final ValueChanged<String?>? onChanged;

  const FilledTextField({
    Key? key,
    required this.name,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.done,
    required this.validators,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      keyboardType: keyboardType,
      textInputAction: action,
      cursorColor: Get.theme.primaryColor,
      style: Get.textTheme.bodyText2?.copyWith(
        color: AppColor.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.light,
        hintText: hint,
        hintStyle: Get.textTheme.bodyText2?.copyWith(
          color: AppColor.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.light),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.light),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.light),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.light),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: validators,
      onChanged: onChanged,
    );
  }
}
