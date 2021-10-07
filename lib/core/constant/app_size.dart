import 'package:flutter/material.dart';
//..

class AppSize {
  static  double calculateHeight(BuildContext context, size) {
    return (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) *
        (size / 812);
  }

  static double calculateWidth(BuildContext context, size) {
    return (MediaQuery.of(context).size.width) * (size / 375);
  }
}
