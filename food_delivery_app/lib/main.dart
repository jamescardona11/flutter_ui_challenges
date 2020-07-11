import 'package:flutter/material.dart';
import 'package:food_delivery_app/consts.dart';
import 'package:food_delivery_app/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.greenColor,
        accentColor: AppColors.greenLightColor,
      ),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
