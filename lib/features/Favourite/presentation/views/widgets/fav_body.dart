import 'package:afro_app/features/Favourite/presentation/view_model/fav_cubit.dart';
import 'package:afro_app/features/Favourite/presentation/view_model/fav_state.dart';
import 'package:afro_app/features/Favourite/presentation/views/favourite_empty_view.dart';
import 'package:afro_app/features/Favourite/presentation/views/widgets/courses_list_view_item.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavBody extends StatelessWidget {
  const FavBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<FavCubit>(context);
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        print("state in ui : $state");
        if (state.favoriteCourses!.isEmpty) {
          return const FavouriteView();
        } else {
          return ListView.builder(
            itemCount: state.favoriteCourses!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CoursesListViewItem(
                  courseModel: state.favoriteCourses![index],
                ),
              );
            },
          );
        }
      },
    );
  }
}
