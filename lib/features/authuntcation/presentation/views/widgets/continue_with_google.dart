import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorApp.continueGoogle, // Color of the border
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  SvgPicture.asset(AssetIcons.google),
                  const SizedBox(width: 8.0),
                  Text(
                    "Continue with Google",
                    style: Styles.textStyle12.copyWith(
                      fontSize: 16,
                      color: ColorApp.continueGoogle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
