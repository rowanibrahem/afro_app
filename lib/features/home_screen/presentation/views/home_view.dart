import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav,.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomNav(),
      ),
    );
  }
}