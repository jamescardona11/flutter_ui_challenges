import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:food_delivery_app/consts.dart';

class LeftBarLayout extends StatefulWidget {
  final double widthbar;

  LeftBarLayout({
    Key? key,
    this.widthbar = 70,
  }) : super(key: key);

  @override
  _LeftBarLayoutState createState() => _LeftBarLayoutState();
}

class _LeftBarLayoutState extends State<LeftBarLayout> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<AlignmentGeometry> _alignmentAnimation;
  late final Tween<AlignmentGeometry> _alignmentTween;

  final List<String> elements = ['Thai', 'Beef', 'Chicken', 'Fresh'];
  final selectedIndex = ValueNotifier<int>(0);
  int align = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _alignmentTween = Tween(
      begin: _calculateAlignment(0),
      end: _calculateAlignment(0),
    );
    _alignmentAnimation = _alignmentTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: widget.widthbar + 25,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: widget.widthbar,
            height: double.infinity,
            color: AppColors.greenColor,
          ),
          Positioned(
            top: size.height * 0.05,
            child: ImageTop(width: widget.widthbar),
          ),
          Positioned(
            top: size.height / 5,
            bottom: size.height / 3,
            child: ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (_, value, __) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ItemText(
                    element: elements[0],
                    selectedIndex: 0 == selectedIndex.value,
                    size: widget.widthbar,
                    onPress: () {
                      _initAnimationAndStart(_alignmentAnimation.value, _calculateAlignment(0));
                      selectedIndex.value = 0;
                    },
                  ),
                  _ItemText(
                    element: elements[1],
                    selectedIndex: 1 == selectedIndex.value,
                    size: widget.widthbar,
                    onPress: () {
                      _initAnimationAndStart(_alignmentAnimation.value, _calculateAlignment(1));
                      selectedIndex.value = 1;
                    },
                  ),
                  _ItemText(
                    element: elements[2],
                    selectedIndex: 2 == selectedIndex.value,
                    size: widget.widthbar,
                    onPress: () {
                      _initAnimationAndStart(_alignmentAnimation.value, _calculateAlignment(2));
                      selectedIndex.value = 2;
                    },
                  ),
                  _ItemText(
                    element: elements[3],
                    selectedIndex: 3 == selectedIndex.value,
                    size: widget.widthbar,
                    onPress: () {
                      _initAnimationAndStart(_alignmentAnimation.value, _calculateAlignment(3));
                      selectedIndex.value = 3;
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.03,
            child: _BottomMenu(size: widget.widthbar),
          ),
          AlignTransition(
            alignment: _alignmentAnimation,
            child: ClipPath(
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
          ),
        ],
      ),
    );
  }

  Alignment _calculateAlignment(int position) {
    double delta = 0.3; //0.9 / (elements.length - 1);
    return Alignment(1, -0.6 + position * delta);
  }

  void _initAnimationAndStart(AlignmentGeometry fromAlign, Alignment toAlign) {
    _alignmentTween.begin = fromAlign;
    _alignmentTween.end = toAlign;
    _animationController.reset();
    _animationController.forward();
  }
}

class _ItemText extends StatelessWidget {
  const _ItemText({
    Key? key,
    required this.element,
    required this.selectedIndex,
    required this.size,
    required this.onPress,
  }) : super(key: key);

  final String element;
  final bool selectedIndex;
  final double size;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 75,
        width: size,
        color: AppColors.greenColor,
        margin: EdgeInsets.only(left: 0),
        child: Transform.rotate(
          angle: -math.pi / 2,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              element,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selectedIndex ? Colors.black : Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomMenu extends StatelessWidget {
  const _BottomMenu({
    Key? key,
    required this.size,
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
    Key? key,
    required this.width,
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
