import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:food_delivery_app/consts.dart';

class LeftBarLayout extends StatelessWidget {
  final double widthbar;
  final List<String> elements = ['Thai', 'Beef', 'Chicken', 'Vegetables'];

  LeftBarLayout({
    Key key,
    this.widthbar = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: widthbar,
          height: double.infinity,
          color: AppColors.greenColor,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: ImageTop(width: widthbar),
                ),
                Positioned(
                  top: size.height / 5,
                  bottom: size.height / 5,
                  child: Container(
                    width: widthbar,
                    height: size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: elements.length,
                      itemBuilder: (context, index) {
                        return Transform.rotate(
                          angle: -math.pi / 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 75),
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  elements[index],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: _BottomMenu(size: widthbar),
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
