import 'dart:math' as math;

import 'package:flutter/material.dart';

class VoiceCircleWidget extends StatefulWidget {
  const VoiceCircleWidget({
    Key? key,
    required this.circle,
    required this.width,
    required this.leftRotationAnimation,
    required this.rightRotationAnimation,
  }) : super(key: key);

  final Animation<double> leftRotationAnimation;
  final Animation<double> rightRotationAnimation;
  final VoiceCircle circle;
  final double width;

  @override
  State<VoiceCircleWidget> createState() => _VoiceCircleWidgetState();
}

class _VoiceCircleWidgetState extends State<VoiceCircleWidget> {
  late Animation<double> animation;

  @override
  void initState() {
    if (widget.circle.normalRotation) {
      animation = widget.leftRotationAnimation;
    } else {
      animation = widget.rightRotationAnimation;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final initialAngle = math.atan2(widget.circle.x, widget.circle.y);
    final radius = widget.width - widget.circle.initialRadius;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final angle = initialAngle - 2 * (animation.value) * math.pi;
        final offsetX = radius * math.cos(angle);
        final offsetY = radius * math.sin(angle);

        return Transform.translate(
          offset: Offset(offsetX, offsetY),
          child: Container(
            width: widget.circle.size,
            height: widget.circle.size,
            decoration: BoxDecoration(
              color: widget.circle.color,
              shape: BoxShape.circle,
            ),
            child: widget.circle.image.isNotEmpty
                ? CircleAvatar(
                    backgroundColor: widget.circle.color,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.circle.image),
                      radius: widget.circle.size / 2 - padding,
                    ),
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }

  double get padding => widget.circle.size <= 60 ? 4 : 6;
}

class VoiceCircle {
  final double size;
  final Color color;
  final Offset initialPosition;
  final double initialRadius;
  final String image;
  final bool normalRotation;

  const VoiceCircle({
    required this.size,
    this.color = Colors.white,
    this.initialPosition = const Offset(0.0, 0.0),
    this.initialRadius = 0.0,
    this.image = '',
    this.normalRotation = true,
  });

  double get x => initialPosition.dx;
  double get y => initialPosition.dy;
}
