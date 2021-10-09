import 'package:test_app/core/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/futures/authentication/register/company_employee_register/models/company_request_model.dart';
import 'dart:convert';



class CompanyRegisterWebService {
  static companyRegister(CompanyRegisterRequestModel companyRegisterRequestModel )async {
    final response = await http.post(Uri.https(Urls.baseUrl, Urls.companyRegisterUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(companyRegisterRequestModel));
    print(response.statusCode);
    if (response.statusCode == 201) {
     

      return true;
    } else
      return json.decode(response.body.toString())['message'];
  }
}
