import 'package:easy_localization/easy_localization.dart';
class Validations {
  static String validateAll(String value) {
    if (value.isEmpty) return 'empty'.tr();

    return null;
  }
  static String validateEmail(String value) {
    if (value.isEmpty) return 'empty'.tr();
    final RegExp nameExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!nameExp.hasMatch(value)) return 'wrong.email'.tr();
    return null;
  }

}