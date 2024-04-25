import 'dart:developer';
import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/features/payment/presentation/views/thankyou_view.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/cridet_card.dart';
import 'package:flutter/material.dart';


class DetailsBody extends StatefulWidget {
  const DetailsBody({super.key});

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[
      // SliverToBoxAdapter(
      //    child: PayMethodListView(),
      // ),
        SliverToBoxAdapter(
          child: CustomCreditCard (
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
            child : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      log('payment');
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return const ThankYouView();
                      },),);
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'Pay',
                ),
              ),
            ),
        ),
      ],
    );
  }
}
