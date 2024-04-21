import 'package:afro_app/core/shared_widget/custom_appbar.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/cart_body.dart';
import 'package:flutter/material.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'My Cart'),
      body: const CartBody(),
    );
  }
}
