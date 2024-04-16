import 'package:afro_app/features/on_boarding/presentation/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingBody(),
      ),
    );
  }
}