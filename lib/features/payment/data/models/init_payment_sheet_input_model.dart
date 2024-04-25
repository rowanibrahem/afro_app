class InitiPaymentSheetInputModel {

  InitiPaymentSheetInputModel(
      {required this.clientSecret,
      required this.customerId,
      required this.ephemeralKeySecret,});
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;
}
