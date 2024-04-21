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
    return Row(
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
          ),
        ),
      ],
    );
  }
}
