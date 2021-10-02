import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //  Redirecting to another page
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed("/landing");
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "dodojan",
            style: Get.textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
