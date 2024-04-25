class PaymentIntentInputModel {

  PaymentIntentInputModel(
      { this.cusomerId, required this.amount, required this.currency,});
  final String amount;
  final String currency;
  final String? cusomerId;

  Map<String, String?> toJson() {
    return {
      'amount': '${amount}00',//multiply in 100
      'currency': currency,
      'customer': cusomerId,
    };
  }
}
