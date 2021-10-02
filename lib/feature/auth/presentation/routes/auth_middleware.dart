import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    const isAuthenticated = false;

    return isAuthenticated ? const RouteSettings(name: "/main") : null;
  }
}
