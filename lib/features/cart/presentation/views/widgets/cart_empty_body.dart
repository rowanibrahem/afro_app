import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/shared_widget/custom_button_mine.dart';
import 'package:afro_app/core/shared_widget/custom_empty_item.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/bottom_nav_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:flutter/material.dart';

class CartEmptyBody extends StatelessWidget {
  const CartEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyPageItem(
      imagePath: AssetImages.cart,
      text1: 'Your Cart is Empty' ,
      text2: 'Looks like you haven’t added' ,
      text3: 'anything to your cart yet', 
      buttonText: 'Go Shop' ,
      onPressed: (){
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBody()),
           );
      },
    );
  }
}
