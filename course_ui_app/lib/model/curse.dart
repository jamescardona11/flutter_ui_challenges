import 'package:course_ui_app/model/course_content.dart';

class Course {
  final String name;
  final double price;
  final double discount;
  final String students;
  final String rating;
  final String image;
  final List<CourseContent> content;

  Course({
    this.name,
    this.price,
    this.discount,
    this.students,
    this.rating,
    this.image,
    this.content,
  });
}
