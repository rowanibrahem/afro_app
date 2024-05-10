import 'package:afro_app/core/errors/failures.dart';
import 'package:afro_app/core/models/couses.dart';
import 'package:dartz/dartz.dart';




abstract class HomeRepo{
  Future<Either<Failure,List<CoursesModel>>> fetchCourses();
  // Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
  // Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
}