import 'package:flutter/material.dart';

class BounceWrapper extends StatefulWidget {
  const BounceWrapper({
    super.key,
    required this.child,
    this.scale = 0.2,
    this.onPressed,
  });

  final Widget child;
  final double scale;
  final VoidCallback? onPressed;

  @override
  BounceWrapperState createState() => BounceWrapperState();
}

class BounceWrapperState extends State<BounceWrapper> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _animate;

  final duration = const Duration(milliseconds: 200);

  @override
  void initState() {
    //defining the controller
    _animate = AnimationController(
      vsync: this,
      duration: duration,
      lowerBound: 0.0,
      upperBound: widget.scale,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animate.value;
    return GestureDetector(
      onTap: _onTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _onTap() {
    widget.onPressed?.call();
    _animate.forward(from: 0.0);

    Future.delayed(duration, () {
      _animate.reverse();
    });
  }

  @override
  void dispose() {
    _animate.dispose();
    super.dispose();
  }
}
