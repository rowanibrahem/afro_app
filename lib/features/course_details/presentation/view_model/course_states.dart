part of 'course_cubit.dart';




abstract class CoursesDetailsState extends Equatable{
  const CoursesDetailsState();
  List <Object> get props =>[];
}
class CoursesDetailsInitial extends CoursesDetailsState{}
class CoursesDetailsLoading extends CoursesDetailsState{}
class CoursesDetailsFailure extends CoursesDetailsState{
  final String errMessage;

  CoursesDetailsFailure(this.errMessage);

}
class CoursesDetailsSuccess extends CoursesDetailsState{
  final List<CoursesModel> books;

  CoursesDetailsSuccess(this.books);
  

}