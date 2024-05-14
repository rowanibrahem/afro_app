// import 'package:afro_app/core/models/courses.dart';
// import 'package:afro_app/features/Favourite/presentation/view_model/fav_state.dart';
// import 'package:afro_app/features/home_screen/data/home_repo.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavCubit extends Cubit<FavState> {
//   final HomeRepo homeRepo;

//   FavCubit(this.homeRepo)
//       : super(
//         FavState(
//           favoriteCourses: [],
//           prefId: [],
          
//         ));

// Future<void> toggleFavorite(String courseId) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   final isFavorite = state.favoriteCourses.any((course) => course.id == int.parse(courseId));
//   final newFavoriteCourses = List.of(state.favoriteCourses);
//   final newPrefId = List.of(state.prefId);

//   if (isFavorite) {
//     newFavoriteCourses.removeWhere((course) => course.id == int.parse(courseId));
//     newPrefId.remove(courseId);
//   } else {
//     // Check if course already exists in favorites
//     if (!newFavoriteCourses.any((course) => course.id == int.parse(courseId))) {
//       // Don't fetch courses again, directly add courseId to prefId
//       newPrefId.add(courseId);

//       // Optionally create a new CoursesModel with default values
//       final newCourse = CoursesModel(
//         id: int.parse(courseId),
//         title: 'Unknown Course',
//         numberOfLessons: 0,
//         numberOfHours: 0.0,
//         overview: '',
//         whatWillYouLearn: const [],
//         price: 0.0,
//         tag: '',
//       );
//       newFavoriteCourses.add(newCourse);
//     }
//   }

//   emit(state.copyWith(
//     favoriteCourses: newFavoriteCourses,
//     prefId: newPrefId,
//   ));
//   prefs.setStringList("prefId", newPrefId);
// }


//  bool isCourseFavorite(String id) {
//     return state.favoriteCourses.any((course) => course.id == id);
//   }
// }
