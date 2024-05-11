// import 'package:afro_app/core/models/fav_model.dart';
// import 'package:afro_app/core/shared_widget/custom_error.dart';
// import 'package:afro_app/core/shared_widget/custom_loading_indicator.dart';
// import 'package:afro_app/features/Favourite/presentation/view_model/fav_state.dart';
// import 'package:afro_app/features/Favourite/presentation/views/widgets/fav_empty_body.dart';
// import 'package:afro_app/features/home_screen/presentation/view_model/courses_cubit.dart';
// import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_list_view_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class FavBody extends StatefulWidget {
//   const FavBody({Key? key}) : super(key: key);

//   @override
//   State<FavBody> createState() => _FavBodyState();
// }

// class _FavBodyState extends State<FavBody> {
//   @override
//   Widget build(BuildContext context) {
//     bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
//     var dw = MediaQuery.of(context).size.width;
//     final List<FavModel> favouriteCourse = BlocProvider.of<FavCubit>(context).state.favoritecourse;
//     if (favouriteCourse.isEmpty) {
//       return const FavEmptyBody();
//     } else{
//       return BlocBuilder<FavCubit, FavState>(
//         builder: (context, state) {
//           // Access favorite courses from state
//           if (state.favoritecourse.isNotEmpty) {
//             return ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.zero,
//               itemCount: state.favoritecourse.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: CoursesListViewItem(
//                     courseModel: state.favoritecourse[index],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const FavEmptyBody();
//           }
//         },
//       );
//     }
//   }
// }
