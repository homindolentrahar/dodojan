class ValueFormatters {
  static String formatTimer(int duration) {
    final minuteSegment = duration / 60;
    final secondSegment = duration % 60;

    return "${minuteSegment.floor().toString().padLeft(2, "0")}:${secondSegment.floor().toString().padLeft(2, "0")}";
  }

  static String formatPhoneNumber({
    String code = "+62",
    required String phone,
  }) {
    var formattedPhone = phone;
    final firstChar = formattedPhone.substring(0, 1);

    if (firstChar == "0") {
      formattedPhone = code + formattedPhone.substring(1);
    }

    return formattedPhone;
  }
}
