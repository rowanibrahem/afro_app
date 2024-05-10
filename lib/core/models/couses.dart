

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CoursesModel extends Equatable{

  CoursesModel(
      {
      this.id,
      this.title,
      this.numberOfLessons,
      this.numberOfHours,
      this.overview,
      this.whatWillYouLearn,
      this.price,
      this.tag,});
  num? id;
  String? title;
  num? numberOfLessons;
  num? numberOfHours;
  String? overview;
  List<String>? whatWillYouLearn;
  num? price;
  String? tag;

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    print('JSON Data before parsing: $json');
  return CoursesModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    numberOfLessons: json['numberOfLessons'] as int?,
    numberOfHours: json['numberOfHours'] as double?,
    overview: json['overview'] as String?,
    whatWillYouLearn: (json['whatWillYouLearn'] as List<dynamic>).cast<String>(),
    price: json['price'] as double?,
    tag: json['tag'] as String?,
  );
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['numberOfLessons'] = this.numberOfLessons;
    data['numberOfHours'] = this.numberOfHours;
    data['overview'] = this.overview;
    data['whatWillYouLearn'] = this.whatWillYouLearn;
    data['price'] = this.price;
    data['tag'] = this.tag;
    return data;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      title,
      numberOfHours,
      numberOfLessons,
      overview,
      whatWillYouLearn,
      price,
      tag,
    ];
  }
}