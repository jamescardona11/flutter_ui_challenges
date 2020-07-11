import 'package:flutter/material.dart';
import 'package:food_delivery_app/consts.dart';

class LeftBarLayout extends StatelessWidget {
  final double size;

  const LeftBarLayout({
    Key key,
    this.size = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: double.infinity,
          color: AppColors.greenColor,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: ImageTop(width: size),
                ),
                Positioned(
                  bottom: 0,
                  child: _BottomMenu(size: size),
                )
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: _MountainPath(),
          child: Container(
            width: 25,
            height: 100,
            color: AppColors.greenColor,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomMenu extends StatelessWidget {
  const _BottomMenu({
    Key key,
    @required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: size - 20,
        height: size - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(Icons.more_vert),
      ),
    );
  }
}

class ImageTop extends StatelessWidget {
  const ImageTop({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Image(
          width: width - 20,
          image: AssetImage('assets/images/profile.jpg'),
        ),
      ),
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