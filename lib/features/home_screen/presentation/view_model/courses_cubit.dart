import 'package:afro_app/core/models/couses.dart';
import 'package:afro_app/features/home_screen/data/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'courses_state.dart';


class CoursesCubit extends Cubit<CoursesState>{
  CoursesCubit(this.homeRepo): super(CoursesInitial());

  final HomeRepo homeRepo;
  Future<void> fetchCourses() async {
    emit(CoursesLoading());
    var result = await homeRepo.fetchCourses();
    result.fold((failure) {
      emit(CoursesFailure(failure.errMessage));
    }, (books) {
      emit(CoursesSuccess(books));
    });
  }
}
