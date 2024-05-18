import 'package:afro_app/constants.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorApp.backgroundScaffold,
      child: HomeBody(userName: name != null ? name! : "user"),
      );
      
  }
}