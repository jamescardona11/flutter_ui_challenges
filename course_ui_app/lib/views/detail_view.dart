import 'package:course_ui_app/constants.dart';
import 'package:course_ui_app/model/course.dart';
import 'package:course_ui_app/model/course_content.dart';
import 'package:course_ui_app/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailView extends StatelessWidget {
  final Course course;

  DetailView(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFf5f4ef),
            image: DecorationImage(
              image: AssetImage(course.image),
              alignment: Alignment.topRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AppBar(),
              SizedBox(height: 30),
              _TopBar(course),
              SizedBox(height: 60),
              Expanded(child: _BottomBar(course)),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Res.arrow_left),
          SvgPicture.asset(Res.more_vertical),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final Course course;

  _TopBar(this.course);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: _BetSellerClipper(),
            child: Container(
              color: kBestSellerColor,
              padding: EdgeInsets.only(left: 5, right: 15, top: 5, bottom: 5),
              child: Text('BETSELLER', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(height: 10),
          Text(course.name, style: kTitleTextStyle),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(Res.person),
              Text(course.students),
              SizedBox(width: 20),
              SvgPicture.asset(Res.person),
              Text(course.rating),
            ],
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '\$${course.finalPrice}', style: kHeadingextStyle.copyWith(fontSize: 32)),
                TextSpan(text: '     '),
                TextSpan(
                  text: '\$${course.price}',
                  style: TextStyle(color: kTextColor.withOpacity(0.5), decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final Course course;

  _BottomBar(this.course);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: course.content.length,
            itemBuilder: (context, index) {
              return _ItemCourseCount(index + 1, course.content[index]);
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: 100,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ItemCourseCount extends StatelessWidget {
  final int index;
  final CourseContent content;

  _ItemCourseCount(this.index, this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text('0$index', style: kHeadingextStyle.copyWith(color: kTextColor.withOpacity(0.15), fontSize: 32)),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${content.time} mins\n',
                  style: TextStyle(color: kTextColor.withOpacity(0.5), fontSize: 18),
                ),
                TextSpan(
                  text: content.name,
                  style: kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w600, height: 1.5),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(
              left: 20,
            ),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(content.available ? 1 : 0.5),
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _BetSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<dynamic> oldClipper) => false;
}
