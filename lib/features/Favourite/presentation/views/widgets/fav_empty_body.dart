import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/shared_widget/custom_empty_item.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:flutter/material.dart';

class FavEmptyBody extends StatelessWidget {
  const FavEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  EmptyPageItem(
      imagePath: AssetImages.favourite,
      text1: 'No Favorites' ,
      text2: 'You can add an item to your' ,
      text3: 'favorites by clicking “Heart Icon', 
      buttonText: 'Go Back' ,
      onPressed: (){
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBody()),
           );
      },
    );
  }
}
