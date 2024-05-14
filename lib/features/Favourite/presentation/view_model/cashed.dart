import 'package:afro_app/core/models/courses.dart';

// ignore: avoid_classes_with_only_static_members
class CourseCache {
  static List<CoursesModel> cachedCourseData = [];

  static void addCourses(List<CoursesModel> courses) {
    cachedCourseData.addAll(courses);
  }

  static CoursesModel? getCourseById(int id) {
  try {
    return cachedCourseData.firstWhere((course) => course.id == id);
  } catch (e) {
    // Handle the exception
    if (e is StateError) {
      // No matching element found, log an error message or handle it accordingly
      print('Error in getCourseById: No matching element found for ID: $id');
    } else {
      // Other errors, log an error message or handle it accordingly
      print('Error in getCourseById: $e');
    }
    return null;
  }
}
}
