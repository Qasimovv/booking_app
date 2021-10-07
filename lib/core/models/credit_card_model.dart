class CreditCard {
  String cardCode;
  String cvv2;
  String month;
  String year;

  CreditCard({this.cardCode, this.cvv2, this.month, this.year});

  CreditCard.fromJson(Map<String, dynamic> json) {
    cardCode = json['cardCode'];
    cvv2 = json['cvv2'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardCode'] = this.cardCode;
    data['cvv2'] = this.cvv2;
    data['month'] = this.month;
    data['year'] = this.year;
    return data;
  }
}
