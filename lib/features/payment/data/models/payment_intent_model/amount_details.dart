import 'package:afro_app/features/payment/data/models/payment_intent_model/tip.dart';

class AmountDetails {

  AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: json['tip'] == null
            ? null
            : Tip.fromJson(json['tip'] as Map<String, dynamic>),
      );
  Tip? tip;

  Map<String, dynamic> toJson() => {
        'tip': tip?.toJson(),
      };
}
