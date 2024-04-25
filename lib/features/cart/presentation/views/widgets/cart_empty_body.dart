import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/shared_widget/custom_button_mine.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/bottom_nav_view.dart';
import 'package:flutter/material.dart';

class CartEmptyBody extends StatelessWidget {
  const CartEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage(AssetImages.cart),
            ),
            const SizedBox(
              height: 38,
            ),
            Text(
                'Your Cart is Empty',
                style: Styles.textStyle28,
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                  'Looks like you haven’t added ',
                style: Styles.textStyle18.copyWith(color: ColorApp.greyCart),
              ),
            ),

            Text(
              'anything to your cart yet',
              style: Styles.textStyle18.copyWith(color: ColorApp.greyCart),
            ),
            const SizedBox(
              height: 26,
            ),
            CustomButtonold(
              backgroundColor: ColorApp.primaryColor,
              text: 'Go Shop' ,
              func: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavView()));
              },

            ),
          ],
        ),
      ),
    );
  }
}
