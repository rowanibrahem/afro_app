import 'package:afro_app/core/shared_widget/custom_Appbar.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/pay_details_body.dart';
import 'package:flutter/material.dart';

class PayDetails extends StatelessWidget {
  const PayDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarTitle(text: 'Payment Details'),
      body:  DetailsBody(),
    );
  }
}
