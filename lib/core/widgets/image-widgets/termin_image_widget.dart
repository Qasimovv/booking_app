import 'package:flutter/material.dart';
import 'package:test_app/core/constant/app_size.dart';

class TerminImageWidget extends StatelessWidget {
  const TerminImageWidget({
    Key key,
    @required this.height,
    @required this.widgth,
  }) : super(key: key);

  final int height;
  final int widgth;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSize.calculateHeight(context, height),
        width: AppSize.calculateWidth(context, widgth),
        child: Image.asset("assets/images/termin.png"));
  }
}
