import 'package:afro_app/core/constants/assets_images.dart';
import 'package:flutter/material.dart';

class CustomCoursesImage extends StatelessWidget {
   const CustomCoursesImage({super.key});
   

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3/3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
        fit: BoxFit.fill, 
         image: AssetImage(
          AssetImages.bookDetails,
         ),
        // image:NetworkImage(
        //   imageUrl,
        // //   errorWidget: (context , url , error) => const Icon(
        // //     Icons.error
        // // ),
        // ),
        // placeholder: (context , url ) =>
        //      Center(child: AnimatedCircularIndicator ())
        // ,
        ),
        ), 
      )
    );
  }
}
