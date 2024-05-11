import 'package:afro_app/core/models/couses.dart';
import 'package:afro_app/core/shared_widget/custom_appbar.dart';
import 'package:afro_app/features/course_details/presentation/view_model/course_cubit.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/course_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key ,  required this. courseModel });
  final CoursesModel? courseModel;

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {

  @override
  void initState(){
    BlocProvider.of<CoursesDetailsCubit>(context).fetchCourseDetails();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
        ),
        body: CourseBody(
          courseModel: widget.courseModel
        ),
      ),
    );
  }
}
