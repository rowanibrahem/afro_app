import 'package:afro_app/core/errors/failures.dart';
import 'package:afro_app/core/models/couses.dart';
import 'package:afro_app/core/utilies/api_services.dart';
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
        endPoint: 'https://0b5d-156-203-193-147.ngrok-free.app/api/v1/course',
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
}
