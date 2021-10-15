import 'dart:developer';

import 'package:dodojan/core/presentation/widgets/app_dialogs.dart';
import 'package:dodojan/core/presentation/widgets/app_snackbars.dart';
import 'package:dodojan/core/utils/value_formatters.dart';
import 'package:dodojan/feature/auth/domain/repository/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'login_controller.freezed.dart';

class LoginController extends GetxController {
  final IAuthRepository authRepository;

  LoginController({required this.authRepository});

  final Rx<LoginState> _state = const LoginState().obs;

  LoginState get state => _state.value;

  void _emit(LoginState value) {
    _state.value = value;
  }

  void phoneChanged(String value) {
    _emit(
      _state.value.copyWith(
        phone: value,
      ),
    );
  }

  void otpChanged(String value) {
    _emit(
      _state.value.copyWith(
        otpCode: value,
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    Get.dialog(const AppLoading());

    final result = await authRepository.signInWithGoogle().then((value) {
      if (Get.isDialogOpen!) {
        Get.back();
      }

      return value;
    });

    result.fold(
      (error) {
        Get.showSnackbar(
          AppSnackbars.errorSnackbar(
            title: error.code,
            message: error.message,
          ),
        );
      },
      (_) {
        Get.offAllNamed("/auth-profile");
      },
    );
  }

  Future<void> signInWithPhone() async {
    Get.dialog(const AppLoading());

    log("Sign in with verification: ${state.verificationId}");

    final result = await authRepository
        .signInWithPhone(
      verificationId: state.verificationId,
      otpCode: state.otpCode,
    )
        .then((value) {
      if (Get.isDialogOpen!) {
        Get.back();
      }

      return value;
    });

    result.fold(
      (error) {
        Get.showSnackbar(
          AppSnackbars.errorSnackbar(
            title: error.code,
            message: error.message,
          ),
        );
      },
      (_) {
        Get.offAllNamed("/auth-profile");
      },
    );
  }

  Future<void> verifyPhone() async {
    Get.dialog(const AppLoading());

    final result = await authRepository
        .verifyPhone(
      phone: ValueFormatters.formatPhoneNumber(phone: state.phone),
      codeSentCallback: (verificationId, resendToken) {
        log("Verification ID: $verificationId\nResend token: $resendToken");
        _emit(
          state.copyWith(
            verificationId: verificationId,
          ),
        );
      },
    )
        .then((value) {
      if (Get.isDialogOpen!) {
        Get.back();
      }

      return value;
    });

    result.fold(
      (error) {
        Get.showSnackbar(
          AppSnackbars.errorSnackbar(
            title: error.code,
            message: error.message,
          ),
        );
      },
      (_) {
        Get.toNamed("/otp");
      },
    );
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default("") String phone,
    @Default("") String verificationId,
    @Default("") String otpCode,
    @Default(false) bool isErrorShown,
  }) = _LoginState;
}
