import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/features/course_details/presentation/views/course_view.dart';
import 'package:flutter/material.dart';

class CustomCoursesImage extends StatelessWidget {
   const CustomCoursesImage({super.key});
   

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CourseView(),
                ),
                );
      },
      child: AspectRatio(
        aspectRatio: 2.3/2.5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
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
        ),
      ),
    );
  }
}
