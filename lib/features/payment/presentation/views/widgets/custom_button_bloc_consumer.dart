import 'dart:developer';
import 'package:afro_app/core/functions/get_transctions.dart';
import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/core/utilies/api_keys.dart';
import 'package:afro_app/features/payment/data/models/amount_model/amount_model.dart';
import 'package:afro_app/features/payment/data/models/item_list_model/item_list_model.dart';
import 'package:afro_app/features/payment/data/models/payment_intent_input_model.dart';
import 'package:afro_app/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:afro_app/features/payment/presentation/views/cart_view.dart';
import 'package:afro_app/features/payment/presentation/views/thankyou_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,

  });
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
        builder: (context,state){
          return CustomButton(
            onTap: (){
              if (isPaypal) {
                final transctionsData = getTransctionsData();
                exceutePaypalPayment(context, transctionsData);
              } else {
                excuteStripePayment(context);
              }
              // PaymentIntentInputModel paymentIntentInputModel =
              //     PaymentIntentInputModel( amount: '100', currency: 'USD' , cusomerId: 'cus_PofnbqUWNS8FLn');
              // BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: state is PaymentLoading ? true : false,
              text: 'Continue',
          );
        },
        listener: (context,state){
          if(state is PaymentSuccess){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return const ThankYouView();
            },
            ),
            );
          }
          if (state is PaymentFailure){
            Navigator.of(context).pop(context);
            final SnackBar snackBar = SnackBar(content: Text(state.errMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
    );
  }
  void excuteStripePayment(BuildContext context) {
    final PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      cusomerId: 'cus_Onu3Wcrzhehlez',
    );
    BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void exceutePaypalPayment(
    BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionsData,) {
    Navigator.of(context).push(
      MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paybalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankYouView();
            },),
                (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          final SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const CartView();
            },),
                (route) {
              return false;
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ),);
  }
}