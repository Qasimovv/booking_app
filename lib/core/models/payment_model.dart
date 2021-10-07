import 'credit_card_model.dart';

class Payment {
  CreditCard creditCard;
  int id;
  String paymentType;

  Payment({this.creditCard, this.id, this.paymentType});

  Payment.fromJson(Map<String, dynamic> json) {
    creditCard = json['creditCard'] != null
        ? new CreditCard.fromJson(json['creditCard'])
        : null;
    id = json['id'];
    paymentType = json['paymentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.creditCard != null) {
      data['creditCard'] = this.creditCard.toJson();
    }
    data['id'] = this.id;
    data['paymentType'] = this.paymentType;
    return data;
  }
}
