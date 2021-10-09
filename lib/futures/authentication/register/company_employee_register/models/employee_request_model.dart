 
class EmployeeRegisterRequestModel {
  int companyId;
  String email;
  String name;
  String password;
  String phoneNumber;
  String surname;

  EmployeeRegisterRequestModel(
      {this.companyId,
      this.email,
      this.name,
      this.password,
      this.phoneNumber,
      this.surname});

  EmployeeRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['surname'] = this.surname;
    return data;
  }
}