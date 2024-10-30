import 'package:afro_app/core/models/courses.dart';
import 'package:afro_app/features/Favourite/presentation/view_model/fav_state.dart';
import 'package:afro_app/features/home_screen/data/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.homeRepo)
      : super(
          const FavState(
            favoriteCourses: [],
            prefId: [],
          ),
        ) {
    _loadFavorites();
  }

  final HomeRepo homeRepo;

  Future<void> _loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> prefId = prefs.getStringList('prefId') ?? [];
    
    // Fetch the courses based on the saved IDs
    final List<CoursesModel> favoriteCourses = [];
    for (final String id in prefId) {
      final course = await _fetchCourseDetails(id);
      if (course != null) {
        favoriteCourses.add(course);
      }
    }

    emit(state.copyWith(
      favoriteCourses: favoriteCourses,
      prefId: prefId,
    ),);
  }

  Future<CoursesModel?> _fetchCourseDetails(String courseId) async {
    final result = await homeRepo.fetchCourseDetails();
    return result.fold(
      (failure) => null,
      (courseDetails) {
        try {
          return courseDetails.firstWhere(
            (course) => course.id.toString() == courseId,
          );
        } catch (e) {
          return null;
        }
      },
    );
  }

  Future<void> toggleFavorite(String courseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int id = int.parse(courseId);
    final isFavorite = state.prefId.contains(courseId);
    final newFavoriteCourses = List<CoursesModel>.from(state.favoriteCourses);
    final newPrefId = List<String>.from(state.prefId);

    if (isFavorite) {
      newFavoriteCourses.removeWhere((course) => course.id == id);
      newPrefId.remove(courseId);
    } else {
      final newCourse = await _fetchCourseDetails(courseId);
      if (newCourse != null) {
        newFavoriteCourses.add(newCourse);
        newPrefId.add(courseId);
      }
    }

    emit(state.copyWith(
      favoriteCourses: newFavoriteCourses,
      prefId: newPrefId,
    ),);
    await prefs.setStringList("prefId", newPrefId);
  }

  bool isCourseFavorite(String id) {
    return state.prefId.contains(id);
  }
}