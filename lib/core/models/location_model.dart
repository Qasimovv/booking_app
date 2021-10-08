class Location {
  String address;
  String city;
  String country;
  String details;
  int latitude;
  int longitude;
  String postCode;

  Location(
      {this.address,
      this.city,
      this.country,
      this.details,
      this.latitude,
      this.longitude,
      this.postCode});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    country = json['country'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    postCode = json['postCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['details'] = this.details;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['postCode'] = this.postCode;
    return data;
  }
}