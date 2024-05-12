import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/thankyou_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBody(),
                ),
           );
        },
      ),
      ),
      body: const ThankYouBody(),
    );
  }
}
