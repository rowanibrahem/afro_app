import 'package:afro_app/core/utilies/api_keys.dart';
import 'package:afro_app/core/utilies/api_services.dart';
import 'package:afro_app/features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:afro_app/features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:afro_app/features/payment/data/models/payment_intent_input_model.dart';
import 'package:afro_app/features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async {
  var response = await apiService.post(
    body: paymentIntentInputModel.toJson(),
    contentType: Headers.formUrlEncodedContentType,
    url: 'https://api.stripe.com/v1/payment_intents',
    token: ApiKeys.secretKey,
  );

  // Check if the response data is of type Map<String, dynamic>
  if (response.data is Map<String, dynamic>) {
    final paymentIntentModel = PaymentIntentModel.fromJson(response.data as Map<String, dynamic>);
    return paymentIntentModel;
  } else {
    // Handle the case when response data is not of the expected type
    throw Exception('Failed to parse payment intent data');
  }
}


  Future initPaymentSheet({required InitiPaymentSheetInputModel initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
        initiPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initiPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Rowan',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
    await createEphemeralKey(customerId: paymentIntentInputModel.cusomerId!);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.cusomerId!,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initiPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2023-10-16',
        });

    var ephermeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephermeralKey;
  }
}
