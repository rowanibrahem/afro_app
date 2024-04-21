class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String? cusomerId;

  PaymentIntentInputModel(
      { this.cusomerId, required this.amount, required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',//multiply in 100
      'currency': currency,
      'customer': cusomerId
    };
  }
}
