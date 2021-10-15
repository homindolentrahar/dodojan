import 'package:dartz/dartz.dart';
import 'package:dodojan/feature/auth/common/error/auth_error.dart';
import 'package:dodojan/feature/auth/domain/model/auth_user.dart';

abstract class IAuthRepository {
  Option<AuthUser> get currentUser;

  Future<bool> get isAuthenticated;

  Future<Either<AuthError, Unit>> signInWithPhone({
    required String verificationId,
    required String otpCode,
  });

  Future<Either<AuthError, Unit>> signInWithGoogle();

  Future<Either<AuthError, Unit>> verifyPhone({
    required String phone,
    required Function(String, int?) codeSentCallback,
  });

  Future<Either<AuthError, Unit>> signOut();
}
