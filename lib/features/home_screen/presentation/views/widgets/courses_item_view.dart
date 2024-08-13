import 'package:afro_app/core/models/courses.dart';
import 'package:afro_app/core/shared_widget/custom_error.dart';
import 'package:afro_app/core/shared_widget/custom_loading_indicator.dart';
import 'package:afro_app/features/home_screen/presentation/view_model/courses_cubit.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesItemView extends StatefulWidget {
  const CoursesItemView({super.key, this.selectedTag});
  final String? selectedTag; 
  

  @override
  State<CoursesItemView> createState() => _CoursesItemViewState();
}

class _CoursesItemViewState extends State<CoursesItemView> {
  // String? selectedTag; 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesSuccess){
          final List<CoursesModel> filteredCourses = widget.selectedTag != null
              ? state.courses.where((course) => course.tag == widget.selectedTag).toList()
              : state.courses;
         return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: filteredCourses.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CoursesListViewItem(
                 courseModel: filteredCourses[index],
                 
              ),
            );
          },
        );
        }else if (state is CoursesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
