import 'package:flutter/material.dart';
import 'package:test_app/core/constant/key.dart';
import 'package:test_app/core/widgets/sncakbar_widget/snackbar_widget.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/models/company_request_model.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/models/employee_request_model.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/service/company_register_web_service.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/service/employee_register_web_service.dart';
import 'package:easy_localization/easy_localization.dart';

class CompanyEmployeeRegisterViewModel with ChangeNotifier {
  CompanyEmployeeRegisterViewModel() {
    //
  }
  companyRegister(
      CompanyRegisterRequestModel companyRegisterRequestModel, context,) async {
    try {
      //state = JobState.BUSY;

      var res =
          await CompanyRegisterWebService.companyRegister(companyRegisterRequestModel);
      if (res == true) {
        // state = JobState.IDLE;
        Keys.formKeyComanyEmployeeRegister.currentState.reset();
        //   //  Route route = MaterialPageRoute(builder: (context) => NavigationForUser());
        //   //  Navigator.pushReplacement(context, route);
        Navigator.pop(context);

        MakeSnackBar.showInSnackBar('register_completed'.tr(), Colors.green,
            Keys.scaffoldKeyCompanyEmployeeRegister);
        Future.delayed(const Duration(milliseconds: 1000), () {
         // SetupRoutes.replaceScreen(context, Routes.USER_LOGIN_PAGE);
        });
      } else {
        Navigator.pop(context);
        MakeSnackBar.showInSnackBar(
            res, Colors.red, Keys.scaffoldKeyCompanyEmployeeRegister);
        // state = JobState.ERROR;
      }
    } catch (e) {
      //state = JobState.ERROR;
    }
  }

empoyeeRegister(
      EmployeeRegisterRequestModel employeeRegisterRequestModel, context) async {
    try {
      //state = JobState.BUSY;

      var res =
          await EmployeeRegisterWebService.employeeRegister(employeeRegisterRequestModel);
      if (res == true) {
        // state = JobState.IDLE;
        Keys.formKeyComanyEmployeeRegister.currentState.reset();
        //   //  Route route = MaterialPageRoute(builder: (context) => NavigationForUser());
        //   //  Navigator.pushReplacement(context, route);
        Navigator.pop(context);

        MakeSnackBar.showInSnackBar('register_completed'.tr(), Colors.green,
            Keys.scaffoldKeyCompanyEmployeeRegister);
        Future.delayed(const Duration(milliseconds: 1000), () {
         // SetupRoutes.replaceScreen(context, Routes.USER_LOGIN_PAGE);
        });
      } else {
        Navigator.pop(context);
        MakeSnackBar.showInSnackBar(
            res, Colors.red, Keys.scaffoldKeyCompanyEmployeeRegister);
        // state = JobState.ERROR;
      }
    } catch (e) {
      //state = JobState.ERROR;
    }
  }



}
