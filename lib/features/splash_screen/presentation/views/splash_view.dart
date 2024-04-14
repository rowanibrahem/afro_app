import "package:afro_app/features/splash_screen/presentation/views/widgets/splash_body.dart";
import "package:flutter/material.dart";

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashBody(),
      ),
      );
  }
}