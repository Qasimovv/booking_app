import 'package:flutter/material.dart';
import 'package:test_app/core/constant/app_size.dart';
import 'package:easy_localization/easy_localization.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.borderColor,
      @required this.backgroundColor,
      @required this.textColor,
      @required this.title,
      @required this.onPressed})
      : super(key: key);

  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    print(title.length);
    return Container(
      width: AppSize.calculateWidth(context, width),
      height: AppSize.calculateWidth(context, height),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: borderColor)),
        onPressed: onPressed,
        color: backgroundColor,
        textColor: textColor,
        child: Text(title.tr(), style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
