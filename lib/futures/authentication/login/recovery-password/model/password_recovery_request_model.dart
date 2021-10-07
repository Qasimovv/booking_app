class PasswordRecoveryModel {
  String email;
  String userTypesEnum;

  PasswordRecoveryModel({this.email, this.userTypesEnum});

  PasswordRecoveryModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userTypesEnum = json['userTypesEnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['userTypesEnum'] = this.userTypesEnum;
    return data;
  }
}