import 'package:test_app/core/models/location_model.dart';

class CompanyRegisterRequestModel {
  String addressDetails;
  String email;
  Location location;
  String name;
  String password;
  String phoneNumber;

  CompanyRegisterRequestModel(
      {this.addressDetails,
      this.email,
      this.location,
      this.name,
      this.password,
      this.phoneNumber});

  CompanyRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    addressDetails = json['addressDetails'];
    email = json['email'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    name = json['name'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressDetails'] = this.addressDetails;
    data['email'] = this.email;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['name'] = this.name;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}