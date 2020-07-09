import 'package:flutter/material.dart';
import 'package:login_animated_app/login_page.dart';
import 'package:login_animated_app/pages/splash_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
