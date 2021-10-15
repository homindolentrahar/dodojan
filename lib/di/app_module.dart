import 'package:dodojan/di/auth_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppModule {
  static void inject() {
    //  Dependencies
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
    Get.put<GoogleSignIn>(GoogleSignIn());
    // Other Modules
    AuthModule.inject();
  }
}
