class SocialMediaAccounts {
  String accountDetails;
  int id;
  String socialMediaAccountType;

  SocialMediaAccounts(
      {this.accountDetails, this.id, this.socialMediaAccountType});

  SocialMediaAccounts.fromJson(Map<String, dynamic> json) {
    accountDetails = json['accountDetails'];
    id = json['id'];
    socialMediaAccountType = json['socialMediaAccountType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountDetails'] = this.accountDetails;
    data['id'] = this.id;
    data['socialMediaAccountType'] = this.socialMediaAccountType;
    return data;
  }
}