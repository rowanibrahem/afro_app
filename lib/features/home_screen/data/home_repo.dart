import 'package:afro_app/core/errors/failures.dart';
import 'package:afro_app/core/models/courses.dart';
import 'package:dartz/dartz.dart';




abstract class HomeRepo{
  Future<Either<Failure,List<CoursesModel>>> fetchCourses();
  // ignore: type_annotate_public_apis
  Future<Either<Failure,List<CoursesModel>>> fetchCourseDetails();
}