import 'package:afro_app/features/payment/data/models/amount_model/details.dart';

class AmountModel {

  AmountModel(
      {required this.total, required this.currency, required this.details,});

  factory AmountModel.fromJson(Map<String, dynamic> json) => AmountModel(
    total: json['total'] as String?,
    currency: json['currency'] as String?,
    details: json['details'] == null
        ? null
        : Details.fromJson(json['details'] as Map<String, dynamic>),
  );
  final String? total;
  final String? currency;
  final Details? details;

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
