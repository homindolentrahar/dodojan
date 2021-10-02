import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:dodojan/core/presentation/timer_cubit.dart';
import 'package:dodojan/core/presentation/widgets/app_buttons.dart';
import 'package:dodojan/core/presentation/widgets/app_snackbars.dart';
import 'package:dodojan/core/utils/value_formatters.dart';
import 'package:dodojan/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    _otpKey = GlobalKey<FormBuilderFieldState>();

    super.initState();
  }

  void _validateAndSubmit() {
    _formKey.currentState?.save();

    if (_formKey.currentState!.validate()) {
      Get.toNamed("/auth-profile");
    } else {
      Get.showSnackbar(
        AppSnackbars.errorSnackbar(
          title: "Kode OTP Invalid",
          message: "Kode OTP yang anda masukkan tidak valid",
        ),
      );
    }

    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final phone = args["phone"] as String;

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
                RichText(
                  text: TextSpan(
                    style: Get.textTheme.bodyText2,
                    children: [
                      const TextSpan(
                        text:
                            "Masukkan kode OTP 6 digit yang telah kami kirimkan ke nomor  ",
                      ),
                      TextSpan(
                        text: ValueFormatters.formatPhoneNumber(phone: phone),
                        style: Get.textTheme.bodyText2?.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 64),
                  BlocBuilder<TimerCubit, int>(
                    bloc: TimerCubit()..startTime(),
                    builder: (ctx, state) => RichText(
                      text: TextSpan(
                        style: Get.textTheme.bodyText2,
                        children: [
                          const TextSpan(
                            text: "Tidak menerima kode?  ",
                          ),
                          state > 0
                              ? TextSpan(
                                  text: ValueFormatters.formatTimer(state),
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
