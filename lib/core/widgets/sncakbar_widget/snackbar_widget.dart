import 'package:flutter/material.dart';
import 'package:test_app/core/constant/key.dart';
import 'package:easy_localization/easy_localization.dart';

Keys key = new Keys();
class MakeSnackBar {
  
  static showInSnackBar(String value, backgroundColor,scaffoldKey) {
   scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value.tr()),
      backgroundColor: backgroundColor,
    ));
  }

  static hideSnackBarr(scaffoldKey) {
    scaffoldKey.currentState.hideCurrentSnackBar();
  }
}
