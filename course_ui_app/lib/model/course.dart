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
    required this.name,
    required this.price,
    required this.discount,
    required this.students,
    required this.rating,
    required this.image,
    required this.content,
  });

  String get finalPrice {
    final p = (price * (1 - discount / 100)).toString();
    return p.substring(0, p.length - 2);
  }
}

Course kCourse = Course(
  name: 'Design Thinking',
  price: 100,
  discount: 30,
  students: '18k',
  rating: '4.6',
  image: 'assets/images/ux_big.png',
  content: [
    CourseContent(
      name: 'Welcome to the course',
      available: true,
      time: '5:35 min',
    ),
    CourseContent(
      name: 'Design Thinking - Intro',
      available: true,
      time: '16:35 min',
    ),
    CourseContent(
      name: 'Design Thinking Process',
      available: false,
      time: '12:35 min',
    ),
    CourseContent(
      name: 'Customer Perspective',
      available: false,
      time: '36:35 min',
    ),
    CourseContent(
      name: 'Design Thinking - Intro 2',
      available: true,
      time: '16:35 min',
    ),
    CourseContent(
      name: 'Design Thinking Process 2',
      available: false,
      time: '12:35 min',
    ),
    CourseContent(
      name: 'Customer Perspective 2',
      available: false,
      time: '36:35 min',
    ),
  ],
);
