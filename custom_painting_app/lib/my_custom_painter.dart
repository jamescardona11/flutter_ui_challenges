import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final List<DrawingArea> points;

  MyCustomPainter({
    this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(rect, backgroundPaint);

    for (int x = 0; x < points.length - 1; ++x) {
      if (points[x].point != null && points[x + 1].point != null) {
        canvas.drawLine(points[x].point, points[x + 1].point, points[x].areaPaint);
      } else if (points[x].point != null && points[x + 1].point == null) {
        canvas.drawPoints(PointMode.points, [points[x].point], points[x].areaPaint);
      }
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => true;
}

class DrawingArea {
  final Offset point;
  final Paint areaPaint;

  DrawingArea({
    this.point,
    this.areaPaint,
  });
}
