// import 'dart:html';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:payment_gateway/core/utilies/api_keys.dart';
// import 'package:payment_gateway/core/utilies/api_services.dart';
// import 'package:payment_gateway/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
// import 'package:payment_gateway/features/checkout/data/models/init_payment_sheet_input_model.dart';
// import 'package:payment_gateway/features/checkout/data/models/payment_intent_input_model.dart';
// import 'package:payment_gateway/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
//
// class StripeService{
//   final ApiService apiServices = ApiService();
//   Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async {
//     var responce = await apiServices.post(
//       body: paymentIntentInputModel.toJson(),
//       // contentType: 'application/x-www-form-urlencoded',
//       contentType: Headers.formUrlEncodedContentType,
//       url: 'https://api.stripe.com/v1/payment_intents',
//       token: ApiKeys.secretKey,
//     );
//     var paymentIntentModel = PaymentIntentModel.fromJson(responce.data);
//     return paymentIntentModel;
//   }
//
//   Future initPaymentSheet({required InitiPaymentSheetInputModel initiPaymentSheetInputModel}) async {
//     await  Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
//         customerEphemeralKeySecret: initiPaymentSheetInputModel.ephemeralKeySecret,
//         customerId: initiPaymentSheetInputModel.customerId,
//         merchantDisplayName: 'Rowan',
//       ),
//     );
//   }
//   Future displayPaymentSheet() async {
//     await Stripe.instance.presentPaymentSheet();
//   }
//   Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
//     var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
//     var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.cusomerId!);
//     var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
//       clientSecret: paymentIntentModel.clientSecret!,
//       customerId: paymentIntentInputModel.cusomerId!,
//       ephemeralKeySecret: ephemeralKeyModel.secret!,
//     );
//     await initPaymentSheet(
//         initiPaymentSheetInputModel: initPaymentSheetInputModel);
//     await displayPaymentSheet();
//   }
//
//   Future<EphemeralKeyModel> createEphemeralKey({
//     required String customerId
//   }) async {
//     var response = await apiServices .post(
//         body: {'customer': customerId},
//         contentType: Headers.formUrlEncodedContentType,
//         url: 'https://api.stripe.com/v1/ephemeral_keys',
//         token: ApiKeys.secretKey,
//         headers: {
//           'Authorization': "Bearer ${ApiKeys.secretKey}",
//           'Stripe-Version': '2023-10-16',
//         });
//
//     var ephermeralKey = EphemeralKeyModel.fromJson(response.data);
//
//     return ephermeralKey;
//   }
// }
