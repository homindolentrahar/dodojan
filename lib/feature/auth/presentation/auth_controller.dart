import 'dart:developer';

import 'package:dodojan/core/common/error/app_error.dart';
import 'package:dodojan/feature/auth/domain/model/auth_user.dart';
import 'package:dodojan/feature/auth/domain/repository/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'auth_controller.freezed.dart';

class AuthController extends GetxController {
  final IAuthRepository authRepository;

  final Rx<AuthState> _state = const AuthState.initial().obs;

  AuthState get state => _state.value;

  AuthController({required this.authRepository});

  void _emit(AuthState value) {
    _state.value = value;
  }

  Future<String> get currentUserId async => authRepository.currentUser.fold(
        () => "",
        (authUser) => authUser.id,
      );

  void checkAuthenticated() {
    final result = authRepository.currentUser;

    _emit(
      result.fold(
        () => const AuthState.unauthenticated(),
        (authUser) => AuthState.authenticated(authUser),
      ),
    );

    log("State: ${_state.value.toString()}");
  }

  Future<void> signOut() async {
    final result = await authRepository.signOut();

    result.fold(
      (error) => _emit(AuthState.error(error)),
      (_) => _emit(const AuthState.unauthenticated()),
    );
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.authenticated(AuthUser user) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.error(AppError error) = _Error;
}
