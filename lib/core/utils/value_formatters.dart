import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
    return code +
        PhoneNumber(
          phoneNumber: phone,
          isoCode: "ID",
          dialCode: code,
        ).parseNumber();
  }
}
