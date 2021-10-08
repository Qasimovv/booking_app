import 'package:flutter/material.dart';
import 'package:test_app/core/validations/validations.dart';
import 'package:easy_localization/easy_localization.dart';
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key key,
    @required this.obscureText,
    @required this.hintText,
    @required this.labelText,
    this.focusColor = Colors.blue,
    //@required this.onFocusChange,
    @required this.onSaved,
    this.validations=Validations.validateAll,
    this.defaultColor = Colors.black,
    this.prefixText=''
    
  }) : super(key: key);

  final bool obscureText;
  final String hintText;
  final String labelText;
  final Color defaultColor;
  final Color focusColor;
  final Function validations;

  //final Function onFocusChange;
  final Function onSaved;
  final String prefixText;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: TextFormField(
          onSaved: widget.onSaved,
          // onSaved: (data) {
          //   setState(() {
          //     password = data;
          //   });
          // },
          
          obscureText: widget.obscureText,
          validator: widget.validations,
          decoration: InputDecoration(
            prefixText: widget.prefixText,
            contentPadding: EdgeInsets.only(left: 10),
            hintText: widget.hintText.tr(),
            labelText: widget.labelText.tr(),
            labelStyle: TextStyle(color: color, fontSize: 12),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
