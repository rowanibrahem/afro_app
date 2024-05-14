part of 'course_cubit.dart';




abstract class CoursesDetailsState extends Equatable{
  const CoursesDetailsState();
  @override
  List <Object> get props =>[];
}
class CoursesDetailsInitial extends CoursesDetailsState{}
class CoursesDetailsLoading extends CoursesDetailsState{}
class CoursesDetailsFailure extends CoursesDetailsState{

  CoursesDetailsFailure(this.errMessage);
  final String errMessage;

}
class CoursesDetailsSuccess extends CoursesDetailsState{

  CoursesDetailsSuccess(this.books);
  final List<CoursesModel> books;
  

}