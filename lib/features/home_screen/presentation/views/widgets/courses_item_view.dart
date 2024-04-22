import 'package:afro_app/core/shared_widget/custom_loading_indicator.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CoursesItemView extends StatefulWidget {
  const CoursesItemView({Key? key}) : super(key: key);

  @override
  State<CoursesItemView> createState() => _CoursesItemViewState();
}

class _CoursesItemViewState extends State<CoursesItemView> {
  @override
  Widget build(BuildContext context) {
            return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CoursesListViewItem(),
              );
            },
          );
  }
}
