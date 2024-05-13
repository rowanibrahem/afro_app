import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:flutter/material.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30 , horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AssetImages.logo , width: 150,height: 150,)),
          SizedBox(height: 10,),
        Text(
          'Thank you for your interest in Afro Asian Board. ',
          style: Styles.textStyle16,
        ),
        const SizedBox(height: 20,),
        RichText(
                text: TextSpan(
                  style: Styles.textStyle16,
                  children: [
                    const TextSpan(
                      text: "Please feel free to reach us with any questions or comments directly at ",
                    ),
                    TextSpan(
                        text: '+201008432096 ',
                        style: Styles.textStyle16.copyWith(color: ColorApp.helpColor),
                    ),
                    const TextSpan(
                      text: 'or ',
                    ),
                    TextSpan(
                      text: 'user@gmail.com',
                      style: Styles.textStyle16.copyWith(color: ColorApp.helpColor),
                    )
                  ],
                ),
              ),
         const  SizedBox(height: 90,),
          CustomButton(
            text: 'Thank You For Getting US!', 
            func: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BottomNavBody(),
                  ),
                  );
            },
            ),
        ],
      ),
    );
  }
}