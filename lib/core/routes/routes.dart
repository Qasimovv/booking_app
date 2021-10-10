import 'package:flutter/material.dart';
import 'package:test_app/core/constant/routes-names.dart';
import 'package:test_app/futures/authentication/login/view/company_employee_login_view.dart';
import 'package:test_app/futures/authentication/login/view/user_login_view.dart';
import 'package:test_app/futures/authentication/main/view/main_page.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/view/company_employee_register_view.dart';
import 'package:test_app/futures/authentication/register/user_register/view/user_register_view.dart';

class SetupRoutes {
  // Set initial route here
  static String initialRoute = Routes.AUTHENTICATION_MAIN_PAGE;

  /// Add entry for new route here
  static Map<String, WidgetBuilder> get routes {
    return {
      //authentication
      Routes.AUTHENTICATION_MAIN_PAGE: (context) => MainPage(),
      Routes.USER_LOGIN_PAGE: (context) => UserLoginPage(),
      Routes.USER_REGISTER_PAGE: (context) => UserRegisterPage(),
      Routes.COMPANY_EMPLOYEE_LOGIN: (context) => CompanyEmployeeLginPage(),
      Routes.COMPANY_EMPLOYEE_REGISTER: (context) => CompanyEmployeeRegisterPage(),



    };
  }

  static Future changeScreen(BuildContext context, String value,
      {Object arguments}) {
    return Navigator.pushNamed(context, value, arguments: arguments);
  }

  static replaceScreen(BuildContext context, String value,
      {dynamic arguments}) {
    Navigator.of(context).pushReplacementNamed(value, arguments: arguments);
  }
}
