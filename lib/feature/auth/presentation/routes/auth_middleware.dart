import 'dart:developer';

import 'package:dodojan/feature/auth/presentation/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authCubit = Get.find<AuthController>()..checkAuthenticated();

    log("Auth status: ${authCubit.state.toString()}");

    final isAuthenticated = authCubit.state.when(
      initial: () => false,
      authenticated: (authUser) {
        log("Logged user : ${authUser.id}");

        return true;
      },
      unauthenticated: () => false,
      error: (error) => false,
    );

    return isAuthenticated ? const RouteSettings(name: "/auth-profile") : null;
  }
}
