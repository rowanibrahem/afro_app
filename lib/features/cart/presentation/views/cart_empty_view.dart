import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/cart/presentation/views/widgets/cart_empty_body.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.backgroundScaffold,
      child: CartEmptyBody()
      );
  }
}