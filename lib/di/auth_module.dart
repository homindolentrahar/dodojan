import 'package:dodojan/feature/auth/data/remote/service/remote_auth_service.dart';
import 'package:dodojan/feature/auth/data/repository/auth_repository.dart';
import 'package:dodojan/feature/auth/domain/repository/i_auth_repository.dart';
import 'package:dodojan/feature/auth/presentation/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthModule {
  static void inject() {
    Get.put<RemoteAuthService>(
      RemoteAuthService(
        firebaseAuth: Get.find<FirebaseAuth>(),
        googleSignIn: Get.find<GoogleSignIn>(),
      ),
    );
    //  Repositories
    Get.put<IAuthRepository>(AuthRepository(
      remoteAuthService: Get.find<RemoteAuthService>(),
    ));
    //  Controllers
    Get.put<AuthController>(AuthController(
      authRepository: Get.find<IAuthRepository>(),
    ));
  }
}
