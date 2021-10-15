import 'package:dodojan/core/presentation/widgets/app_buttons.dart';
import 'package:dodojan/feature/auth/presentation/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late LoginController _loginController;

  @override
  void initState() {
    _loginController = Get.find<LoginController>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "dodojan",
                style: Get.textTheme.headline4?.copyWith(
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kelola Data Warung Jajan Hanya dengan Jari",
                  style: Get.textTheme.headline1,
                ),
                const SizedBox(height: 8),
                Text(
                  "Nikmati kemudahan dalam mengelola data warung jajan dari layar handphone",
                  style: Get.textTheme.bodyText2,
                ),
              ],
            ),
            const SizedBox(height: 64),
            Image.asset(
              "assets/images/landing.png",
              width: Get.width * 0.65,
            ),
            const SizedBox(height: 64),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  text: "Masuk",
                  onPressed: () {
                    //  To the login
                    Get.toNamed("/login");
                  },
                ),
                const SizedBox(height: 16),
                SecondaryButton(
                  text: "Google",
                  onPressed: () {
                    _loginController.signInWithGoogle();
                  },
                ),
              ],
            ),
          ],
        ).paddingAll(32),
      ),
    );
  }
}
