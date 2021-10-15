class AuthUser {
  String id;
  final String? email;
  final String? phone;
  final String provider;
  final DateTime createdAt;
  final DateTime lastSignInAt;

  AuthUser({
    this.id = "",
    this.email,
    this.phone,
    required this.provider,
    required this.createdAt,
    required this.lastSignInAt,
  });
}
