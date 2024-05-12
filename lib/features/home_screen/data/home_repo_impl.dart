import 'package:afro_app/core/errors/failures.dart';
import 'package:afro_app/core/models/courses.dart';
import 'package:afro_app/core/services/api_services.dart';
import 'package:afro_app/features/home_screen/data/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, List<CoursesModel>>> fetchCourses() async {
    try {
      final dynamic data = await apiService.get(
        endPoint: 'v1/course',
      );

      if (data is List) {
        final List<CoursesModel> courses = [];
        for (dynamic item in data) {
          if (item is Map<String, dynamic>) { // Check if item is of expected type
            courses.add(CoursesModel.fromJson(item));
          }
        }
        return right(courses);
      } else {
        return left(ServerFailure('Unexpected data format for courses'));
      }
    } catch (e) {
      print('error: $e');
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
   @override
  Future<Either<Failure, List<CoursesModel>>> fetchCourseDetails() async {
    try {
      final data = await apiService.get(
          endPoint:
          'v1/course'
          );
      if (data is List) {
        final List<CoursesModel> coursesdetails = [];
        for (dynamic item in data) {
          if (item is Map<String, dynamic>) { // Check if item is of expected type
            coursesdetails.add(CoursesModel.fromJson(item));
          }
        }
        return right(coursesdetails);
      }
      else {
        return left(ServerFailure('Unexpected data format for courses'));
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
