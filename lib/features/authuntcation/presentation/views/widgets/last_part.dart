import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class LastPart extends StatelessWidget {
  const LastPart({
    required this.buttonText,
    required this.text1,
    required this.onPressed,
  });
  final String buttonText;
  final VoidCallback onPressed;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text(
            text1,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: Styles.textStyle12.copyWith(color: ColorApp.smallColorLogin),
            ),
          ),
        ],
      ),
    );
  }
}
