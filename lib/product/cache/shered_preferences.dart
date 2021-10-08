import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static writeAllShared(
      {String authorization,
      int userId,
      bool isLoggedIn,
      userTypesEnum}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Authorization', authorization);
    prefs.setInt('id', userId);
    prefs.setBool("isLoggedIn", isLoggedIn);
    prefs.setString('role', '$userTypesEnum');
  }

  static clearAllShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
