import 'package:afro_app/features/payment/data/models/payment_intent_model/card.dart';

class PaymentMethodOptions {

  PaymentMethodOptions({this.card});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
    );
  }
  Card? card;

  Map<String, dynamic> toJson() => {
        'card': card?.toJson(),
      };
}
