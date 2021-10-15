import 'package:dodojan/di/app_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dodojan/core/common/theme/app_theme.dart';
import 'package:dodojan/core/presentation/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppModule.inject();

  runApp(const DodojanApp());
}

class DodojanApp extends StatelessWidget {
  const DodojanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dodojan",
      theme: AppTheme.getTheme(),
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}
