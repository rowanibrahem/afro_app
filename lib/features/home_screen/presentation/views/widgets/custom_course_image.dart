import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/models/couses.dart';
import 'package:afro_app/features/course_details/presentation/views/course_view.dart';
import 'package:flutter/material.dart';

class CustomCoursesImage extends StatelessWidget {
    CustomCoursesImage({super.key ,  this.courseModel});
   final CoursesModel? courseModel;

   List<String> list = [
      
    ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  CourseView(courseModel: courseModel),
                ),
                );
      },
      child: AspectRatio(
        aspectRatio: 2.2/2.5,
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
