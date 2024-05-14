
import "package:flutter/material.dart";
class Course {

  Course({required this.id, required this.title, required this.description, this.isFavorite = false});
  final int id;
  final String title;
  final String description;
  bool isFavorite;
}

class CourseListPage extends StatefulWidget {
  @override
  _CourseListPageState createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  List<Course> courses = [
    Course(id: 1, title: 'Course 1', description: 'Description 1'),
    Course(id: 2, title: 'Course 2', description: 'Description 2'),
    Course(id: 3, title: 'Course 3', description: 'Description 3'),
  ];
  List<Course> favoriteCourses = [];

  void toggleFavorite(Course course) {
    setState(() {
      course.isFavorite = !course.isFavorite;
      if (course.isFavorite) {
        favoriteCourses.add(course);
      } else {
        favoriteCourses.remove(course);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: Text(course.description),
            trailing: IconButton(
              icon: Icon(
                course.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: course.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                toggleFavorite(course);
              },
            ),
          );
        },
      ),
    );
  }
}