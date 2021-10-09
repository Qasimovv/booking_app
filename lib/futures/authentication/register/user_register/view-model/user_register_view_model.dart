import 'package:flutter/material.dart';
import 'package:test_app/core/constant/key.dart';
import 'package:test_app/core/constant/routes-names.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/widgets/sncakbar_widget/snackbar_widget.dart';
import 'package:test_app/futures/authentication/register/user_register/models/user_register_request_model.dart';
import 'package:test_app/futures/authentication/register/user_register/service/user_register_web_service.dart';
import 'package:easy_localization/easy_localization.dart';

class UserRegisterViewModel with ChangeNotifier {
  UserRegisterViewModel() {
    //
  }
  userSignUp(UserRegisterRequestModel userRegisterRequestModel, context, scaffoldKey) async {
    try {
      //state = JobState.BUSY;
      
      var res =
          await UserRegisterWebService.userSigUp(userRegisterRequestModel);
      if (res == true) {
        // state = JobState.IDLE;
        Keys.formKeyUserRegister.currentState.reset();
        //   //  Route route = MaterialPageRoute(builder: (context) => NavigationForUser());
        //   //  Navigator.pushReplacement(context, route);
        Navigator.pop(context);

        MakeSnackBar.showInSnackBar('register_completed'.tr(), Colors.green,
            Keys.scaffoldKeyUserRegister);
        Future.delayed(const Duration(milliseconds: 1000), () {
          SetupRoutes.replaceScreen(context, Routes.USER_LOGIN_PAGE);
        });
      } else {
        Navigator.pop(context);
        MakeSnackBar.showInSnackBar(
            res, Colors.red, Keys.scaffoldKeyUserRegister);
        // state = JobState.ERROR;
      }
    } catch (e) {
      //state = JobState.ERROR;
    }
  }
}
