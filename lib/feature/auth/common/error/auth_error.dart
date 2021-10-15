import 'package:dodojan/core/common/error/app_error.dart';

class AuthError extends AppError {
  AuthError(String code, String message) : super(code, message);
}
