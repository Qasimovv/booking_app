class UserLoginRequestModel {
  //
  String email;
  String password;
  String userTypesEnum;

  UserLoginRequestModel({this.email, this.password, this.userTypesEnum});

  UserLoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    userTypesEnum = json['userTypesEnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['userTypesEnum'] = this.userTypesEnum;
    return data;
  }
}