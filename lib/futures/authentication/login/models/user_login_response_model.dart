import 'package:test_app/core/models/payment_model.dart';
import 'package:test_app/core/models/social_media_accounts_model.dart';

class UserLoginResponseModel {
  String email;
  int id;
  String imageUrl;
  String name;
  Payment payment;
  String phoneNumber;
  String qrCodeValue;
  List<SocialMediaAccounts> socialMediaAccounts;
  String surname;
  int unreadNotificationCount;

  UserLoginResponseModel(
      {this.email,
      this.id,
      this.imageUrl,
      this.name,
      this.payment,
      this.phoneNumber,
      this.qrCodeValue,
      this.socialMediaAccounts,
      this.surname,
      this.unreadNotificationCount});

  UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    payment =
        json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    phoneNumber = json['phoneNumber'];
    qrCodeValue = json['qrCodeValue'];
    if (json['socialMediaAccounts'] != null) {
      socialMediaAccounts = new List<SocialMediaAccounts>();
      json['socialMediaAccounts'].forEach((v) {
        socialMediaAccounts.add(new SocialMediaAccounts.fromJson(v));
      });
    }
    surname = json['surname'];
    unreadNotificationCount = json['unreadNotificationCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
    }
    data['phoneNumber'] = this.phoneNumber;
    data['qrCodeValue'] = this.qrCodeValue;
    if (this.socialMediaAccounts != null) {
      data['socialMediaAccounts'] =
          this.socialMediaAccounts.map((v) => v.toJson()).toList();
    }
    data['surname'] = this.surname;
    data['unreadNotificationCount'] = this.unreadNotificationCount;
    return data;
  }
}

