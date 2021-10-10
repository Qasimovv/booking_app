import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:test_app/core/validations/validations.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomGooglePlaceAutoCompleteTextField extends StatefulWidget {
  const CustomGooglePlaceAutoCompleteTextField(
      {Key key,
      @required this.hintText,
      @required this.labelText,
      @required this.getPlaceDetailWithLatLng,
      @required this.itmClick,
      @required this.textEditingController,
      this.focusColor = Colors.blue,
      //@required this.onFocusChange,
      @required this.onSaved,
      this.validations = Validations.validateAll,
      this.defaultColor = Colors.black,
      this.prefixText = ''})
      : super(key: key);

  final String hintText;
  final String labelText;
  final Color defaultColor;
  final Color focusColor;
  final Function validations;

  //final Function onFocusChange;
  final Function onSaved;
  final String prefixText;
  final Function getPlaceDetailWithLatLng;
  final Function itmClick;
  final TextEditingController textEditingController;

  @override
  _CustomGooglePlaceAutoCompleteTextFieldState createState() => _CustomGooglePlaceAutoCompleteTextFieldState();
}

class _CustomGooglePlaceAutoCompleteTextFieldState extends State<CustomGooglePlaceAutoCompleteTextField> {
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
        child: GooglePlaceAutoCompleteTextField(
          
          textEditingController: widget.textEditingController,
    
          // obscureText: widget.obscureText,
          // validator: widget.validations,
          googleAPIKey: "AIzaSyD1caUC_1LXjslxGkc6QaGk5jgrOqoUHbM",
          isLatLngRequired: true,
          getPlaceDetailWithLatLng: widget.getPlaceDetailWithLatLng,
          itmClick: widget.itmClick,
          inputDecoration: InputDecoration(
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
          debounceTime: 10,
        ),
      ),
    );
  }
}
