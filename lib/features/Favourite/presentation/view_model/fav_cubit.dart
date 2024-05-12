import 'package:afro_app/core/models/courses.dart';
import 'package:afro_app/features/Favourite/presentation/view_model/fav_state.dart';
import 'package:afro_app/features/home_screen/data/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavCubit extends Cubit<FavState> {
  final HomeRepo homeRepo;

  FavCubit(this.homeRepo)
      : super(
        FavState(
          favoriteCourses: [],
          prefId: [],
          
        ));

  Future<void> toggleFavorite({String courseId = '1'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final isFavorite = state.favoriteCourses.any((course) => course.id == courseId);
    final newFavoriteCourses = List.of(state.favoriteCourses);
    final newPrefId = List.of(state.prefId);

    if (isFavorite) {
      newFavoriteCourses.removeWhere((course) => course.id == courseId);
      newPrefId.remove(courseId);
    } else {
      final eitherCoursesOrFailure = await homeRepo.fetchCourses();
      eitherCoursesOrFailure.fold(
        (failure) {
          // Handle failure
          print('Failed to fetch courses: $failure');
        },
        (courses) {
          // Find the course with the matching ID
          final newCourse = courses.firstWhere(
            (course) => course.id == courseId,
            orElse: () => CoursesModel(
              id: 1, 
              title: 'Unknown Course',
              numberOfLessons: 0,
              numberOfHours: 0,
              overview: '',
              whatWillYouLearn: [],
              price: 0,
              tag: '',
            ),
          );
          newFavoriteCourses.add(newCourse);
          newPrefId.add(courseId);
        },
      );
    }

    emit(state.copyWith(
      favoriteCourses: newFavoriteCourses,
      prefId: newPrefId,
    ));
    prefs.setStringList("prefId", newPrefId);
  }

  bool isCourseFavorite(String id) {
    return state.favoriteCourses.any((course) => course.id == id);
  }
}