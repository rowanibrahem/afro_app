import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
    
  const WelcomeText({
    required this.welcomeText,
    required this.signInText,
  });

  final String welcomeText;
    final String signInText;
  @override
  Widget build(BuildContext context) {
    
     final double screenWidth = MediaQuery.of(context).size.width;

    final double leftPosition = screenWidth >= 600 ? 50 : 20;

    final double topPosition = screenWidth >= 600 ? 100 : 55;

    return Positioned(
      top: topPosition ,// 20% from the top
      left: leftPosition,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
           welcomeText,
            style: Styles.textStyle36,
          ),
          Text(
            signInText,
            style: Styles.textStyle16.copyWith(color: ColorApp.loginColor),
          ),
        ],
      ),
    );
  }
}