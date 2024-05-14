part of 'courses_cubit.dart';


abstract class CoursesState extends Equatable{
  const CoursesState();
  @override
  List <Object> get props =>[];
}
class CoursesInitial extends CoursesState{}
class CoursesLoading extends CoursesState{}
class CoursesFailure extends CoursesState{

  const CoursesFailure(this.errMessage);
  final String errMessage;

}
class CoursesSuccess extends CoursesState{

  CoursesSuccess(this.courses);
  final List<CoursesModel> courses;

}