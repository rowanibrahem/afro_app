import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
   this.backgroundColor,
    this.borderRadius,
    required this.text,
    this.fontSized,
    this.textColor,
    required this.func,
     this.width,
    this.height = 43,
    this.isLoading = false,
  });
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontSized;
  final String text;
  final VoidCallback func;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: func,
          style: ElevatedButton.styleFrom(
            // minimumSize: const Size(double.infinity, 10),
            backgroundColor: ColorApp.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            shape: RoundedRectangleBorder(
               borderRadius: borderRadius ?? BorderRadius.circular(24),
            ),
            // minimumSize: Size(150, 50),
          ),
          child: Center(
            child: isLoading
            ? const CircularProgressIndicator()
            :Text(
              text,
              style: Styles.textStyle16.copyWith(color: textColor ?? Colors.black,),
            ),
          ),
        ),
      ),
    );
  }
}
