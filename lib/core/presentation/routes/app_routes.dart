import 'package:dodojan/core/presentation/screens/splash_screen.dart';
import 'package:dodojan/feature/auth/presentation/routes/auth_middleware.dart';
import 'package:dodojan/feature/auth/presentation/screens/auth_profile_screen.dart';
import 'package:dodojan/feature/auth/presentation/screens/landing_screen.dart';
import 'package:dodojan/feature/auth/presentation/screens/login_screen.dart';
import 'package:dodojan/feature/auth/presentation/screens/otp_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: "/",
      title: "Splash",
      transition: Transition.fadeIn,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: "/landing",
      title: "Landing",
      transition: Transition.rightToLeftWithFade,
      middlewares: [AuthMiddleware()],
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: "/login",
      title: "Login",
      transition: Transition.rightToLeft,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: "/otp",
      title: "OTP",
      transition: Transition.rightToLeft,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: "/auth-profile",
      title: "Auth Profile",
      transition: Transition.rightToLeftWithFade,
      page: () => const AuthProfileScreen(),
    ),
  ];
}
