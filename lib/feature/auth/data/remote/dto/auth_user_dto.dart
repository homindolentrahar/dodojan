import 'package:dodojan/feature/auth/domain/model/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_user_dto.g.dart';

@JsonSerializable()
class AuthUserDto {
  final String id;
  final String email;
  final String phone;
  final String provider;
  final String createdAt;
  final String lastSignInAt;

  AuthUserDto({
    this.id = "",
    this.email = "",
    this.phone = "",
    this.provider = "",
    this.createdAt = "",
    this.lastSignInAt = "",
  });

  factory AuthUserDto.fromFirebaseUser(User? user) => AuthUserDto(
        id: user?.uid ?? "",
        email: user?.email ?? "",
        phone: user?.phoneNumber ?? "",
        provider: user?.providerData[0].providerId ?? "",
        createdAt: user?.metadata.creationTime?.toIso8601String() ?? "",
        lastSignInAt: user?.metadata.lastSignInTime?.toIso8601String() ?? "",
      );

  factory AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserDtoToJson(this);

  AuthUser toModel() => AuthUser(
        id: id,
        email: email,
        phone: phone,
        provider: provider,
        createdAt: DateTime.parse(createdAt),
        lastSignInAt: DateTime.parse(lastSignInAt),
      );
}
