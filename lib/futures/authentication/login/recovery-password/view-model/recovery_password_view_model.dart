import 'package:flutter/material.dart';
import 'package:test_app/core/widgets/sncakbar_widget/snackbar_widget.dart';
import 'package:test_app/futures/authentication/login/recovery-password/model/password_recovery_request_model.dart';
import 'package:test_app/futures/authentication/login/recovery-password/service/password_recovery_service.dart';

class PasswordRecoveryViewModel with ChangeNotifier {
  PasswordRecoveryViewModel() {
//
  }

  recoveyPassword(context, email, userTypeEnum,scaffoldKey) async {
    MakeSnackBar.hideSnackBarr(scaffoldKey);

    try {

      PasswordRecoveryModel passwordRecoveryModel = new PasswordRecoveryModel(
          email: email, userTypesEnum: userTypeEnum.toString());
      var response = await PasswordRecoveyWebService.passwordRecoverySend(
          passwordRecoveryModel);

      if (response == true) {

        MakeSnackBar.showInSnackBar(
            'check_inbox', Colors.green,scaffoldKey);

        Navigator.pop(context);
      } else {
        MakeSnackBar.showInSnackBar(response, Colors.red,scaffoldKey);
        Future.delayed(const Duration(milliseconds: 2000), () {
          MakeSnackBar.hideSnackBarr(scaffoldKey);
        });
      }
    } catch (e) {
      MakeSnackBar.showInSnackBar('recovery_problem', Colors.red,scaffoldKey);
    }
  }
}
