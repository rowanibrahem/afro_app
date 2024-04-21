import 'package:afro_app/core/constants/assets_images.dart';
import 'package:flutter/material.dart';

class LogoTop extends StatelessWidget {
  const LogoTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
                  top: 20,
                  right: 20,
                  child: Image.asset(
                    AssetImages.logo,
                    height: 50, 
                    width: 50,
                  ),
                );
  }
}