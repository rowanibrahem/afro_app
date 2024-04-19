import 'package:afro_app/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: OnboardingBody(),
      ),
    );
  }
}
