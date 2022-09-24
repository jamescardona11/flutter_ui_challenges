import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  /// default constructor
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Text'),
      ),
      body: Center(
        child: CircularFABMenuWidget(),
      ),
    );
  }
}

class CircularFABMenuWidget extends StatefulWidget {
  @override
  _CircularFABMenuWidgetState createState() => _CircularFABMenuWidgetState();
}

class _CircularFABMenuWidgetState extends State<CircularFABMenuWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.only(bottom: 30, right: 30),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            _MenuItem(
              icon: Icons.add,
              color: Colors.blue,
              animationDirection: AnimationDirection.top,
              controller: animationController,
            ),
            _MenuItem(
              icon: Icons.camera_alt,
              color: Colors.black,
              animationDirection: AnimationDirection.diagonal,
              controller: animationController,
            ),
            _MenuItem(
              icon: Icons.person,
              color: Colors.orange,
              animationDirection: AnimationDirection.left,
              controller: animationController,
            ),
            _MenuItem(
              icon: Icons.menu,
              color: Colors.red,
              size: 60,
              controller: animationController,
              onPress: () {
                if (animationController.status == AnimationStatus.completed) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum AnimationDirection { none, top, left, diagonal }

class _MenuItem extends StatefulWidget {
  final double size;
  final IconData icon;
  final Color color;
  final AnimationDirection animationDirection;
  final AnimationController controller;
  final VoidCallback? onPress;

  const _MenuItem({
    Key? key,
    this.size = 50,
    required this.icon,
    required this.color,
    required this.controller,
    this.onPress,
    this.animationDirection = AnimationDirection.none,
  }) : super(key: key);

  @override
  __MenuItemState createState() => __MenuItemState();
}

class __MenuItemState extends State<_MenuItem>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleAnimation = getScaleValue().animate(widget.controller);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) => Transform.translate(
        offset: widget.animationDirection == AnimationDirection.none
            ? const Offset(0, 0)
            : Offset.fromDirection(getOffset(), scaleAnimation.value * 100),
        child: Transform(
          alignment: Alignment.center,
          transform:
              Matrix4.rotationZ(getRadianFromDegree(rotationAnimation.value))
                ..scale(scaleAnimation.value),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                widget.icon,
                color: Colors.white,
              ),
              enableFeedback: true,
              onPressed: widget.onPress,
            ),
          ),
        ),
      ),
    );
  }

  double getOffset() {
    switch (widget.animationDirection) {
      case AnimationDirection.left:
        return getRadianFromDegree(180);
      case AnimationDirection.diagonal:
        return getRadianFromDegree(225);
      case AnimationDirection.top:
        return getRadianFromDegree(270);
      default: //none
        return 0;
    }
  }

  TweenSequence<double> getScaleValue() {
    switch (widget.animationDirection) {
      case AnimationDirection.left:
        return TweenSequence<double>([
          TweenSequenceItem(
              tween: Tween<double>(begin: 0.0, end: 1.6), weight: 35),
          TweenSequenceItem(
              tween: Tween<double>(begin: 1.6, end: 1.0), weight: 65),
        ]);
      case AnimationDirection.diagonal:
        return TweenSequence<double>([
          TweenSequenceItem(
              tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55),
          TweenSequenceItem(
              tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45),
        ]);
      case AnimationDirection.top:
        return TweenSequence<double>([
          TweenSequenceItem(
              tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75),
          TweenSequenceItem(
              tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25),
        ]);
      default: //none
        return TweenSequence([
          TweenSequenceItem(
              tween: Tween<double>(begin: 1.0, end: 1.0), weight: 100)
        ]);
    }
  }

  double getRadianFromDegree(double degree) {
    const unitRadian = 57.295779513;
    return degree / unitRadian;
  }
}
