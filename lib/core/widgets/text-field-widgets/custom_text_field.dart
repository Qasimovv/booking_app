import 'package:flutter/material.dart';
import 'package:test_app/core/validations/validations.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key key,
    @required this.obscureText,
    @required this.hintText,
    @required this.labelText,
    this.focusColor = Colors.blue,
    //@required this.onFocusChange,
    @required this.onChanged,
    this.validations = Validations.validateAll,
    this.defaultColor = Colors.black,
  }) : super(key: key);

  final bool obscureText;
  final String hintText;
  final String labelText;
  final Color defaultColor;
  final Color focusColor;
  final Function validations;


  //final Function onFocusChange;
  final Function onChanged;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color color;
  @override
  void initState() {
    // TODO: implement initState
    color = widget.defaultColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() => color = hasFocus ? widget.focusColor : Colors.black);
      },
      //onFocusChange: widget.onFocusChange,
      child: TextFormField(
        onChanged: widget.onChanged,
        // onSaved: (data) {
        //   setState(() {
        //     password = data;
        //   });
        // },
        obscureText: widget.obscureText,
        validator: widget.validations,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: widget.hintText.tr(),
          labelText: widget.labelText.tr(),
          labelStyle: TextStyle(color: color, fontSize: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
