import 'package:afro_app/core/shared_widget/custom_button_mine.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/pop_up.dart';
import 'package:afro_app/features/payment/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';

Widget buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButtonold(
            text: 'Add to cart',
            textColor: Colors.white,
            func: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PopUp(),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          CustomButtonold(
            borderRadius: BorderRadius.circular(15),
            backgroundColor: Colors.white,
            text: 'Buy now',
            func: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
