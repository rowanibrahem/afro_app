import 'package:afro_app/core/errors/failures.dart';
import 'package:afro_app/features/payment/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';


abstract class CheckoutRepo{
  Future<Either<Failure , void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}

