class UserRegisterRequestModel {
  String email;
  String name;
  String password;
  String phoneNumber;
  String surname;

  UserRegisterRequestModel(
      {this.email, this.name, this.password, this.phoneNumber, this.surname});

  UserRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['surname'] = this.surname;
    return data;
  }
}
