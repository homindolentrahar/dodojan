import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:dodojan/core/presentation/timer_controller.dart';
import 'package:dodojan/core/presentation/widgets/app_buttons.dart';
import 'package:dodojan/core/presentation/widgets/app_snackbars.dart';
import 'package:dodojan/core/utils/value_formatters.dart';
import 'package:dodojan/feature/auth/presentation/login_controller.dart';
import 'package:dodojan/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late GlobalKey<FormBuilderState> _formKey;
  late GlobalKey<FormBuilderFieldState> _otpKey;
  late LoginController _loginController;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    _otpKey = GlobalKey<FormBuilderFieldState>();
    _loginController = Get.find<LoginController>();

    super.initState();
  }

  void _validateAndSubmit() {
    _formKey.currentState?.save();

    if (_formKey.currentState!.validate()) {
      _loginController.signInWithPhone();
    } else {
      Get.showSnackbar(
        AppSnackbars.errorSnackbar(
          title: "Kode OTP Invalid",
          message: "Kode OTP yang anda masukkan tidak valid",
        ),
      );
    }
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
                  "Verifikasi Nomor Handphone",
                  style: Get.textTheme.headline1,
                ),
                const SizedBox(height: 8),
                GetX<LoginController>(
                  init: _loginController,
                  builder: (controller) => RichText(
                    text: TextSpan(
                      style: Get.textTheme.bodyText2,
                      children: [
                        const TextSpan(
                          text:
                              "Masukkan kode OTP 6 digit yang telah kami kirimkan ke nomor  ",
                        ),
                        TextSpan(
                          text: controller.state.phone,
                          style: Get.textTheme.bodyText2?.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: OTPPinField(
                      fieldKey: _otpKey,
                      onChanged: (value) {
                        _loginController.otpChanged(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 64),
                  GetX<TimerController>(
                    builder: (controller) => RichText(
                      text: TextSpan(
                        style: Get.textTheme.bodyText2,
                        children: [
                          const TextSpan(
                            text: "Tidak menerima kode?  ",
                          ),
                          controller.state.value > 0
                              ? TextSpan(
                                  text: ValueFormatters.formatTimer(
                                    controller.state.value,
                                  ),
                                )
                              : TextSpan(
                                  text: "Kirim Ulang",
                                  style: Get.textTheme.bodyText2?.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //  Resend OTP code
                                    },
                                ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: "Verifikasi",
                    onPressed: () {
                      //  Verifikasi kode OTP
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
