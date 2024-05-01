import 'package:afro_app/features/course_details/presentation/views/widgets/build_button.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/build_course_image.dart';
import 'package:flutter/material.dart';

class CourseBody extends StatelessWidget {
  const CourseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           buildCourseImageAndDetails(),
          //  const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildButtons(context),
            ),
          ],
        ),
      ),
      
    );
  }
}
