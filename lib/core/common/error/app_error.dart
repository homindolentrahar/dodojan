class AppError extends Error {
  final String code;
  final String message;

  AppError(this.code, this.message);

  @override
  String toString() => "$code: $message";
}
