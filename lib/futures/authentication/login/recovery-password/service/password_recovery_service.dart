import 'package:http/http.dart' as http;
import 'package:test_app/core/constant/urls.dart';
import 'dart:convert';

import 'package:test_app/futures/authentication/login/recovery-password/model/password_recovery_request_model.dart';



class PasswordRecoveyWebService {
  static passwordRecoverySend(
      PasswordRecoveryModel passwordRecoveryModel) async {
    final response =
        await http.post(Uri.https(Urls.baseUrl, Urls.passwordRecoveryUrl),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(passwordRecoveryModel));
    if (response.statusCode == 200 && json.decode(response.body.toString())['status']=='success')
      return true;
    else
      return json.decode(response.body.toString())['message'];
  }
}
