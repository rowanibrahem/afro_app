import 'package:afro_app/core/models/courses.dart';
import 'package:afro_app/features/home_screen/data/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'course_states.dart';


class CoursesDetailsCubit extends Cubit<CoursesDetailsState>{
  CoursesDetailsCubit(this.homeRepo): super(CoursesDetailsInitial());

  final HomeRepo homeRepo;
  // ignore: type_annotate_public_apis
  Future<void> fetchCourseDetails() async {
  emit(CoursesDetailsLoading());
  const String specificCourseId = '123';
  final result = await homeRepo.fetchCourseDetails();
  result.fold((failure) {
    emit(CoursesDetailsFailure(failure.errMessage));
  }, (courseDetail) {
    // Access course details directly from courseDetail object
    emit(CoursesDetailsSuccess(courseDetail));
  });
}
}
