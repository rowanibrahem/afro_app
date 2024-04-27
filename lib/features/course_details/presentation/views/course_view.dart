import 'package:afro_app/features/course_details/presentation/views/widgets/course_view_body.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavBody()));
            },
          ),
        ),
        body: const CourseBody(),
      ),
    );
  }
}
