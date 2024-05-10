import 'package:afro_app/core/errors/failures.dart';
import 'package:afro_app/core/utilies/stripe_services.dart';
import 'package:afro_app/features/payment/data/models/payment_intent_input_model.dart';
import 'package:afro_app/features/payment/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );

      return right(null);
    } on StripeException catch (e) {
      return left(
        ServerFailure(
          'Oops there was an error',
          ),
          );
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
