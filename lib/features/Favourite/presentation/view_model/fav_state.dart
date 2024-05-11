// import 'package:afro_app/core/models/fav_model.dart';
// import 'package:afro_app/features/Favourite/presentation/views/widgets/test_fav.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavState extends Equatable {

//   const FavState({
//     // required this.availableMeals,
//     required this.favoritecourse,
//     required this.prefId,
//     // required this.availableCategory,FavState
//     required this.filters,
//   });
//   // final List<Meal> availableMeals;
//   final List<FavModel> favoritecourse;
//   final List<String> prefId;
//   // final List<Category> availableCategory;
//   final Map<String, bool> filters;

//   @override
//   List<Object?> get props =>
//       [ favoritecourse, prefId,filters];
      
//         FavState copyWith({
//     List<FavModel>? favoritecourse,
//     List<String>? prefId,
//     Map<String, bool>? filters,
//   }) {
//     return FavState(
//       favoritecourse: favoritecourse ?? this.favoritecourse,
//       prefId: prefId ?? this.prefId,
//       filters: filters ?? this.filters,
//     );
//   }

// }

// class FavCubit extends Cubit<FavState> {
//   FavCubit(): super(
//     FavState(
//       favoritecourse: [],
//       prefId: [],
//       filters: {
//         'gluten': false,
//         'lactose': false,
//         'vegan': false,
//         'vegetarian': false,
//       },
//     ));

//   Future<void> toggleFavorite(String courseId) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     final isFavorite = state.favoritecourse.any((course) => course.id == courseId);
//     final newFavoritecourse = List.of(state.favoritecourse);
//     final newPrefId = List.of(state.prefId);

//     if (isFavorite) {
//       newFavoritecourse.removeWhere((course) => course.id == courseId);
//       newPrefId.remove(courseId);
//     } else {
//       final newCourse = fetchCourses.firstWhere((course) => course.id == courseId);
//       newFavoritecourse.add(newCourse);
//       newPrefId.add(courseId);
//     }

//    emit(state.copyWith(favoritecourse: newFavoritecourse, prefId: newPrefId));
//     prefs.setStringList("prefId", newPrefId);
//   }

//   bool isCourseFavorite(String id) {
//     return state.favoritecourse.any((course) => course.id == id);
//   }
// }
