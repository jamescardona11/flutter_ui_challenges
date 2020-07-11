import 'package:flutter/material.dart';
import 'package:food_delivery_app/consts.dart';

class LeftBarLayout extends StatelessWidget {
  final double width;

  const LeftBarLayout({
    Key key,
    this.width = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: double.infinity,
          color: AppColors.greenColor,
        ),
        ClipPath(
          clipper: _MountainPath(),
          child: Container(
            width: 25,
            height: 100,
            color: AppColors.greenColor,
          ),
        ),
      ],
    );
  }
}

class _MountainPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 4, 8, 15);
    path.quadraticBezierTo(size.width - 1, size.height / 2 - 16, size.width, size.height / 2);
    path.quadraticBezierTo(size.width + 1, size.height / 2 + 16, 8, size.height - 15);
    path.quadraticBezierTo(0, size.height - 4, 0, size.height);
    path.close();

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
