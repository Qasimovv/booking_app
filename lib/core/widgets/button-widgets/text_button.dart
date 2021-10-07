import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_app/core/constant/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key key,
    @required this.text,
    @required this.onPressed
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: buildText());
  }

  Text buildText() {
    return Text(
      text.tr(),
      style: TextStyle(
        shadows: [
          Shadow(color: ColorConst.programColor, offset: Offset(0, -5))
        ],
        color: Colors.transparent,
        fontSize: 16,
        decorationColor: ColorConst.programColor,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
