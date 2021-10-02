import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthPhoneTextField extends StatelessWidget {
  final String phoneCode;
  final ValueChanged<String?>? onChanged;

  const AuthPhoneTextField({
    Key? key,
    this.phoneCode = "+62",
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          phoneCode,
          style: Get.textTheme.headline1,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FormBuilderTextField(
            name: "phone",
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            cursorColor: Get.theme.primaryColor,
            style:
                Get.textTheme.headline1?.copyWith(fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: "857-1122-3344",
              hintStyle: Get.textTheme.headline1?.copyWith(
                color: AppColor.grey,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class OTPPinField extends StatelessWidget {
  final GlobalKey<FormBuilderFieldState> fieldKey;
  final ValueChanged<String> onChanged;

  const OTPPinField({
    Key? key,
    required this.fieldKey,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      key: fieldKey,
      appContext: context,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      length: 6,
      animationType: AnimationType.scale,
      textStyle: Get.textTheme.headline1,
      hintStyle: Get.textTheme.headline1?.copyWith(
        color: AppColor.grey,
        fontWeight: FontWeight.normal,
      ),
      cursorColor: Get.theme.primaryColor,
      cursorHeight: 20,
      errorTextSpace: 32,
      pinTheme: PinTheme(
        fieldWidth: 24,
        borderWidth: 1.5,
        activeColor: Get.theme.primaryColor,
        selectedColor: Get.theme.primaryColor,
        inactiveColor: AppColor.grey,
        errorBorderColor: AppColor.red,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context,
            errorText: "Kode OTP tidak boleh kosong"),
        FormBuilderValidators.minLength(context, 6,
            errorText: "Kode OTP tidak valid"),
      ]),
      onChanged: onChanged,
    );
  }
}
