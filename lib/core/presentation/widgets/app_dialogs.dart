import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: SpinKitFadingCircle(
          color: AppColor.white,
          size: 32,
        ),
      ),
    );
  }
}
