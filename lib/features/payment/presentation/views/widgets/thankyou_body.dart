import 'package:afro_app/features/payment/presentation/views/widgets/Custom_check_icon.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/Custom_dashed_line.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/thankyou_card.dart';
import 'package:flutter/material.dart';

class ThankYouBody extends StatefulWidget {
  const ThankYouBody({super.key});

  @override
  State<ThankYouBody> createState() => _ThankYouBodyState();
}

class _ThankYouBodyState extends State<ThankYouBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Thankyou_card(),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              left: 20+16,
              right: 20+16,
              child: const CustomDashedLine(),
            ),
            Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height*.2,
              child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
            ),
            Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height*.2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            const Positioned(
              top: -50,
                left: 0,
                right: 0,
                child: CustomCheckIcon(),
            ),
          ],
        ),
      ),
    );
  }
}






