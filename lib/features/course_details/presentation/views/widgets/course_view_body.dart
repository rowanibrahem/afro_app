import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/shared_widget/custom_button_mine.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/pop_up.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/rating.dart';
import 'package:afro_app/features/payment/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';

class CourseBody extends StatelessWidget {
  const CourseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                AssetImages.courseDetails,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Learn web development',
                style: Styles.textStyleNoto16.copyWith(fontSize: 20),
                ),
                const Rating(),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'OverView',
                  style: Styles.textStyleNoto16.copyWith(fontSize: 20),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet consectetur.Purus pulvinar eget in molestie aenean metus tortor. Odio eget urna odio mauris.',
                  style: Styles.textStyle12,
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                 ' What will you learn',
                 style: Styles.textStyleNoto16.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'EGP 1,999.99',
                  style: Styles.textStyle16.copyWith(fontSize: 20),
                  ),
                  
                 Padding(
              padding: const EdgeInsets.all(8),
              child: CustomButtonold(
                text: 'Add to cart', 
                textColor: Colors.white,
                func: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const PopUp()
                  ),
                  );
                },
                width:double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomButtonold(
                borderRadius: BorderRadius.circular(15),
                backgroundColor: Colors.white,
                text: 'Buy now ' ,  
                func: (){
                  Navigator.push(
                    context,
                     MaterialPageRoute(
                      builder: (context)=> const CartView(),
                  ),
                  );
                },
                width:double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}