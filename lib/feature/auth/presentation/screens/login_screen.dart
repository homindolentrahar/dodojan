import 'dart:developer';

import 'package:dodojan/core/presentation/widgets/app_buttons.dart';
import 'package:dodojan/core/presentation/widgets/app_snackbars.dart';
import 'package:dodojan/core/utils/value_formatters.dart';
import 'package:dodojan/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();

    super.initState();
  }

  void _validateAndSubmit() {
    _formKey.currentState?.save();

    if (_formKey.currentState!.value["phone"] != null &&
        _formKey.currentState!.value["phone"] != "") {
      //  Send verification code
      final phoneNumber =
          _formKey.currentState!.value["phone"] ?? "85711223344";
      final formattedPhone =
          ValueFormatters.formatPhoneNumber(phone: phoneNumber);

      log("Phone: $formattedPhone");

      Get.toNamed("/otp", arguments: {"phone": formattedPhone});
    } else {
      //  Show error snackbar
      Get.showSnackbar(
        AppSnackbars.errorSnackbar(
          title: "Nomor HP Invalid",
          message: "Nomor Handphone yang anda masukkan tidak valid",
        ),
      );
    }

    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(32),
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: AppBackButton(),
            ),
            const SizedBox(height: 32),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Siap Mengelola Data Warungmu Hari Ini?",
                  style: Get.textTheme.headline1,
                ),
                const SizedBox(height: 8),
                Text(
                  "Masuk dengan mengisi nomor handphone aktif pada form di bawah",
                  style: Get.textTheme.bodyText2,
                ),
              ],
            ),
            const SizedBox(height: 32),
            FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthPhoneTextField(
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 64),
                  PrimaryButton(
                    text: "Kirim",
                    onPressed: () {
                      _validateAndSubmit();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
