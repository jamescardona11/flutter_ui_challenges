import 'package:course_ui_app/constants.dart';
import 'package:course_ui_app/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _AppBar(),
                SizedBox(height: 25),
                _SearchBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Res.menu),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            Res.user,
            width: 35,
            height: 35,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hey James,',
          style: kStyleBold.copyWith(fontSize: 22),
        ),
        SizedBox(height: 10),
        Text(
          'Find a course you want to learn',
          style: kStyleLight.copyWith(fontSize: 16),
        ),
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          height: 55,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(Res.search),
              SizedBox(width: 10),
              Text(
                'Search for anything',
                style: kStyleLight.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
