import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_list_view_item.dart';
import 'package:flutter/material.dart';


class CoursesItemView extends StatefulWidget {
  const CoursesItemView({super.key});

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
              return  const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CoursesListViewItem(),
              );
            },
          );
  }
}
