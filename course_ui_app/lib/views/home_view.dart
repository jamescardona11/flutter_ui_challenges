import 'package:course_ui_app/constants.dart';
import 'package:course_ui_app/model/category.dart';
import 'package:course_ui_app/model/course.dart';
import 'package:course_ui_app/res.dart';
import 'package:course_ui_app/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _AppBar(),
              SizedBox(height: 25),
              _SearchBar(),
              SizedBox(height: 30),
              Expanded(
                child: _CourseGrid(),
              ),
            ],
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
          style: kHeadingextStyle,
        ),
        SizedBox(height: 5),
        Text(
          'Find a course you want to learn',
          style: kSubheadingextStyle,
        ),
        SizedBox(height: 25),
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

class _CourseGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories', style: kTitleTextStyle.copyWith(fontSize: 18)),
            Text('See All', style: kTitleTextStyle.copyWith(color: kBlueColor, fontSize: 18)),
          ],
        ),
        SizedBox(height: 15),
        Expanded(
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailView(kCourse)));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${categories[index].name}', style: kTitleTextStyle.copyWith(fontSize: 16)),
                      Text('${categories[index].courses} courses',
                          style: TextStyle(color: kTextColor.withOpacity(0.5))),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
