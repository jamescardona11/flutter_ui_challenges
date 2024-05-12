import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircularPercent extends StatelessWidget {
  final double percent;
  final Color primaryColor;
  final double size;

  const CircularPercent({
    required this.percent,
    this.primaryColor = Colors.blueAccent,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(percentToString(),
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            )),
        Container(
          width: size,
          height: size,
          child: CustomPaint(
            painter: _MyRadialProgress(
              percent: percent,
              primaryColor: primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  String percentToString() {
    final percentString = percent.toString();
    return '${percentString.substring(0, percentString.length - 2)}%';
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percent;
  final Color primaryColor;

  _MyRadialProgress({required this.percent, required this.primaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..strokeWidth = 2
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final arcPaint = Paint()
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..color = primaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = math.min(size.width, size.height) * 0.5;
    canvas.drawCircle(center, radius, circlePaint);

    final double arcAngle = 2 * math.pi * percent / 100;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      arcAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
