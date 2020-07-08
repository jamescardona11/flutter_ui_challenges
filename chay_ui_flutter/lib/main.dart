import 'package:flutter/material.dart';
import 'package:chay_ui_flutter/presentation/home/home_page.dart';

//https://dribbble.com/shots/6428387-Messenger-Mobile-Concept
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      home: HomePage(),
    );
  }
}
