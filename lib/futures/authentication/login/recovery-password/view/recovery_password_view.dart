import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/constant/colors.dart';
import 'package:test_app/core/validations/validations.dart';
import 'package:test_app/core/widgets/button-widgets/rectangle_button.dart';
import 'package:test_app/core/widgets/text-field-widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_app/futures/authentication/login/recovery-password/view-model/recovery_password_view_model.dart';

class RecoveryPassword {
  static openRecoveryPassword(context,scaffoldKey) {
    String email;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: EdgeInsets.only(top: 0.0),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'what_is_your_email_adress'.tr(),
                      style: TextStyle(fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextField(
                        obscureText: false,
                        hintText: 'email',
                        labelText: 'email',
                        focusColor: ColorConst.programColor,
                        defaultColor: ColorConst.greyTextColor,
                        validations: Validations.validateEmail,
                        onChanged: (data) {
                          email = data;
                          print(email);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20),
                      child: RectangleButton(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 22,
                          borderColor: ColorConst.programColor,
                          backgroundColor: ColorConst.programColor,
                          textColor: ColorConst.whiteTextColor,
                          title: 'send_password_reset_email',
                          onPressed: () {
                            Provider.of<PasswordRecoveryViewModel>(context,
                                    listen: false)
                                .recoveyPassword(context, email, 'BASIC_USER',scaffoldKey);
                          }),
                    ),

                    // Text('er')
                  ],
                ),
              ),
            ),
          );
        });
  }
}
