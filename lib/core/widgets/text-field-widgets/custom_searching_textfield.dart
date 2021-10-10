import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:test_app/core/validations/validations.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomSearchingTextField extends StatefulWidget {
  const CustomSearchingTextField(
      {Key key,
      @required this.obscureText,
      @required this.hintText,
      @required this.labelText,
      @required this.suggestionsCallback,
      @required this.itemBuilder,
      @required this.onSuggestionSelected,
      this.textEditingController,
      this.focusColor = Colors.blue,
      //@required this.onFocusChange,
      //@required this.onSaved,
      this.validations = Validations.validateAll,
      this.defaultColor = Colors.black,
      this.prefixText = ''})
      : super(key: key);

  final bool obscureText;
  final String hintText;
  final String labelText;
  final Color defaultColor;
  final Color focusColor;
  final Function validations;

  //final Function onFocusChange;
  //final Function onSaved;
  final String prefixText;
  final TextEditingController textEditingController;
  final SuggestionsCallback suggestionsCallback;
  final ItemBuilder itemBuilder;
  final Function onSuggestionSelected;

  @override
  _CustomSearchingTextFieldState createState() =>
      _CustomSearchingTextFieldState();
}

class _CustomSearchingTextFieldState extends State<CustomSearchingTextField> {
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
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: widget.textEditingController,
            autofocus: false,

            // onSaved: widget.onSaved,
            // onSaved: (data) {
            //   setState(() {
            //     password = data;
            //   });
            // },
            obscureText: widget.obscureText,

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
          suggestionsCallback: widget.suggestionsCallback,
          itemBuilder: widget.itemBuilder,
          onSuggestionSelected: widget.onSuggestionSelected,
        ),
      ),
    );
  }
}
