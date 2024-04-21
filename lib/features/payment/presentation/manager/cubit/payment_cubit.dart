import 'dart:developer';
import 'package:afro_app/features/payment/data/models/payment_intent_input_model.dart';
import 'package:afro_app/features/payment/data/repos/checkout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
          (l) => emit(PaymentFailure(l.errMessage)),
          (r) => emit(
        PaymentSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
