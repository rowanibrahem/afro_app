import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CoursesModel extends Equatable {
  CoursesModel({
    this.id,
    this.title,
    this.numberOfLessons,
    this.numberOfHours,
    this.overview,
    this.whatWillYouLearn,
    this.price,
    this.tag,
    this.imagePath,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    print('JSON Data before parsing: $json');
    return CoursesModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      numberOfLessons: json['numberOfLessons'] as int?,
      numberOfHours: json['numberOfHours'] as double?,
      overview: json['overview'] as String?,
      whatWillYouLearn:
          (json['whatWillYouLearn'] as List<dynamic>).cast<String>(),
      price: json['price'] as double?,
      tag: json['tag'] as String?,
      imagePath: json['imagePath'] as String?,
    );
  }
  num? id;
  String? title;
  num? numberOfLessons;
  num? numberOfHours;
  String? overview;
  List<String>? whatWillYouLearn;
  num? price;
  String? tag;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['numberOfLessons'] = numberOfLessons;
    data['numberOfHours'] = numberOfHours;
    data['overview'] = overview;
    data['whatWillYouLearn'] = whatWillYouLearn;
    data['price'] = price;
    data['tag'] = tag;
    data['imagePath'] = imagePath;
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
      imagePath,
    ];
  }
}
