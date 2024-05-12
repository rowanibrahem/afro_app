import 'package:afro_app/core/models/courses.dart';
import 'package:equatable/equatable.dart';

class FavState extends Equatable {
  const FavState({
    required this.favoriteCourses,
    required this.prefId,
    
  });

  final List<CoursesModel> favoriteCourses; // Updated type here
  final List<String> prefId;
 

  @override
  List<Object?> get props => [favoriteCourses, prefId,];

  FavState copyWith({
    List<CoursesModel>? favoriteCourses,
    List<String>? prefId,
   
  }) {
    return FavState(
      favoriteCourses: favoriteCourses ?? this.favoriteCourses,
      prefId: prefId ?? this.prefId,
      
    );
  }
}
