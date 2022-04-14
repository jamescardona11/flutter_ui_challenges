import 'package:flutter/material.dart';

import 'constants.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint semiCirclePaint = Paint()..color = Colors.white;
    final Paint circlePaint = Paint()..color = Colors.deepPurple;

    final semiCircle = Path()
      ..moveTo(0, size.height / 2)
      ..arcToPoint(Offset(size.width, size.height / 2),
          radius: Radius.circular(size.width / 2));

    final circle = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.width / 2),
          radius: (size.width - 2 * borderCircle) / 2,
        ),
      );

    // canvas.drawPath(shadowCircle, shadow);
    canvas.drawPath(semiCircle, semiCirclePaint);
    canvas.drawPath(circle, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
