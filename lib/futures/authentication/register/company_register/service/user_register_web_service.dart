import 'package:test_app/core/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/futures/authentication/register/user_register/models/user_register_request_model.dart';
import 'dart:convert';



class UserRegisterWebService {
  static userSigUp(UserRegisterRequestModel userRegisterRequestModel )async {
    final response = await http.post(Uri.https(Urls.baseUrl, Urls.userRegisterUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userRegisterRequestModel));
    print(response.statusCode);
    if (response.statusCode == 201) {
     

      return true;
    } else
      return json.decode(response.body.toString())['message'];
  }
}
