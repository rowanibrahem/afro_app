import 'package:afro_app/core/shared_widget/custom_error.dart';
import 'package:afro_app/core/shared_widget/custom_loading_indicator.dart';
import 'package:afro_app/features/home_screen/presentation/view_model/courses_cubit.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesItemView extends StatefulWidget {
  const CoursesItemView({super.key});

  @override
  State<CoursesItemView> createState() => _CoursesItemViewState();
}

class _CoursesItemViewState extends State<CoursesItemView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesSuccess){
         return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.courses.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CoursesListViewItem(
                 courseModel: state.courses[index],
              ),
            );
          },
        );
        }else if (state is CoursesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return LoadingIndicator();
        }
      },
    );
  }
}
