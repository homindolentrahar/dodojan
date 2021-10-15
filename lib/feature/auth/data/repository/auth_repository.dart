import 'package:dartz/dartz.dart';
import 'package:dodojan/feature/auth/common/error/auth_error.dart';
import 'package:dodojan/feature/auth/data/remote/service/remote_auth_service.dart';
import 'package:dodojan/feature/auth/domain/model/auth_user.dart';
import 'package:dodojan/feature/auth/domain/repository/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final RemoteAuthService remoteAuthService;

  AuthRepository({
    required this.remoteAuthService,
  });

  @override
  Option<AuthUser> get currentUser =>
      remoteAuthService.currentUser == null
          ? none()
          : some(remoteAuthService.currentUser!.toModel());

  @override
  Future<bool> get isAuthenticated async =>
      remoteAuthService.currentUser != null;

  @override
  Future<Either<AuthError, Unit>> signInWithGoogle() async {
    try {
      await remoteAuthService.signInWithGoogle();

      return right(unit);
    } on AuthError catch (e) {
      return left(e);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthError(
          e.code,
          e.message ?? "Unknown Error",
        ),
      );
    }
  }

  @override
  Future<Either<AuthError, Unit>> signInWithPhone({
    required String verificationId,
    required String otpCode,
  }) async {
    try {
      await remoteAuthService.signInWithPhone(
        verificationId: verificationId,
        otpCode: otpCode,
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthError(
          e.code,
          e.message ?? "Unknown Error",
        ),
      );
    }
  }

  @override
  Future<Either<AuthError, Unit>> verifyPhone({
    required String phone,
    required Function(String, int?) codeSentCallback,
  }) async {
    try {
      await remoteAuthService.verifyPhone(
        phone: phone,
        codeSentCallback: codeSentCallback,
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthError(
          e.code,
          e.message ?? "Unknown Error",
        ),
      );
    }
  }

  @override
  Future<Either<AuthError, Unit>> signOut() async {
    try {
      await remoteAuthService.signOut();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthError(
          e.code,
          e.message ?? "Unknown Error",
        ),
      );
    }
  }
}
