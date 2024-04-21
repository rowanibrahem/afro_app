import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.3,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SvgPicture.asset(
        AssetIcons.loginCurve,
        fit: BoxFit.fill,
      ),
    );
  }
}
