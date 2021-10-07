import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/core/widgets/sncakbar_widget/snackbar_widget.dart';
import 'package:test_app/futures/authentication/login/models/user_login_request_model.dart';
import 'package:test_app/futures/authentication/login/service/login_web_service.dart';
import 'package:flutter/material.dart';
//enum JobState { IDLE, BUSY, ERROR }

class UserLoginViewModel with ChangeNotifier {
  // JobState _state;

  // List<Job> jobList;

  UserLoginViewModel() {
    //jobList = [];
    //  _state = JobState.IDLE;
    //fetchJobs();
  }

  // JobState get state => _state;
  // set state(JobState state) {
  //   _state = state;
  //   notifyListeners();
  // }

  login(BuildContext context, { email, password, userTypeEnum,scaffoldKey}) async {
    try {
      //state = JobState.BUSY;
      UserLoginRequestModel userLoginRequestModel = new UserLoginRequestModel(
          email: email,
          password: password,
          userTypesEnum: userTypeEnum.toString());
      var res = await LoginWebService.signIn(userLoginRequestModel);
      if (res == true) {
        // state = JobState.IDLE;
        //   //  Route route = MaterialPageRoute(builder: (context) => NavigationForUser());
        //   //  Navigator.pushReplacement(context, route);

        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        MakeSnackBar.showInSnackBar(res, Colors.red,scaffoldKey);
        // state = JobState.ERROR;
      }
    } catch (e) {
      //state = JobState.ERROR;
    }
  }
}
