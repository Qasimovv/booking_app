import 'package:http/http.dart' as http;
import 'package:test_app/core/constant/urls.dart';
import 'dart:convert';

import 'package:test_app/futures/authentication/login/models/user_login_request_model.dart';
import 'package:test_app/product/cache/shered_preferences.dart';

class LoginWebService {
  static signIn(UserLoginRequestModel userLoginRequestModel) async {
    final response = await http.post(Uri.https(Urls.baseUrl, Urls.userLoginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userLoginRequestModel));
    print(response.statusCode);
    if (response.statusCode == 200) {
      SharedPreferencesUtils.getAllShared(
          authorization: response.headers['authorization'],
          userId: json.decode(response.body.toString())['data']['id'],
          isLoggedIn: true,
          userTypesEnum: "1");

      return true;
    } else
      return json.decode(response.body.toString())['message'];

  }
  
}
