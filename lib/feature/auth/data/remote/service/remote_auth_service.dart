import 'dart:developer';

import 'package:dodojan/feature/auth/common/error/auth_error.dart';
import 'package:dodojan/feature/auth/data/remote/dto/auth_user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RemoteAuthService {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  RemoteAuthService({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  AuthUserDto? get currentUser => firebaseAuth.currentUser == null
      ? null
      : AuthUserDto.fromFirebaseUser(firebaseAuth.currentUser);

  Future<void> signInWithGoogle() async {
    final account = await googleSignIn.signIn();

    if (account == null) {
      throw AuthError("cancelled-by-user", "Batal masuk menggunakan Google");
    }

    final authentication = await account.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );

    await firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signInWithPhone({
    required String verificationId,
    required String otpCode,
  }) async {
    log("Verifying: $verificationId");

    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );

    await firebaseAuth.signInWithCredential(credential);
  }

  Future<void> verifyPhone({
    required String phone,
    required Function(String, int?) codeSentCallback,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) {
        firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        throw error;
      },
      codeSent: codeSentCallback,
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<void> signOut() => Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
}
