import 'package:flutter/material.dart';

class VoiceCirclePath extends CustomPainter {
  final List<double> radius;

  VoiceCirclePath({
    required this.radius,
  });

  final List<Color> colors = const [
    Color(0xffE2E0FF),
    Color(0xffD9D6FF),
    Color(0xffC4C1FF),
  ];

  final Paint pencilOne = Paint()
    ..color = const Color(0xffE8E8FF)
    ..style = PaintingStyle.fill;

  final Paint pencilTwo = Paint()
    ..color = const Color(0xff023e8a)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.7;

  @override
  Future<void> paint(Canvas canvas, Size size) async {
    for (int i = 0; i < radius.length; ++i) {
      final newRadius = size.width / 2 - radius[i];
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        newRadius,
        pencilOne..color = colors[i],
      );
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        newRadius,
        pencilTwo,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter customPainter) => false;
}
