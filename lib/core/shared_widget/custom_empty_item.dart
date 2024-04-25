import 'package:afro_app/core/shared_widget/custom_button_mine.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class EmptyPageItem extends StatelessWidget {
  const EmptyPageItem({
    super.key,
    required this.text1,
    required this.text2,
    required this.imagePath,
    required this.text3,
     required this.buttonText, 
     required this.onPressed,
    
  });
  final String text1;
  final String text2;
  final String imagePath;
  final String text3;
   final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
          ),
          const SizedBox(
            height: 38,
          ),
          Text(
            text1,
            style: Styles.textStyle28,
            textScaler: const TextScaler.linear(1),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              text2,
              style: Styles.textStyle18.copyWith(color: ColorApp.greyCart),
            ),
          ),
          Text(
            text3,
            style: Styles.textStyle18.copyWith(color: ColorApp.greyCart),
          ),
          const SizedBox(
            height: 26,
          ),
          CustomButtonold(
            text: buttonText,
             func: onPressed,
             ),
        ],
      ),
    );
  }
}
