import 'package:flutter/material.dart';

class OvalHeaderClipper extends CustomClipper<Path> {
  OvalHeaderClipper({this.expand = true});

  final bool expand;

  @override
  Path getClip(Size size) {
    final value = expand ? 0.2 : 0.5;
    final lineTo = 1 - value;
    final controlPoint = 1 + value;

    return Path()
      ..lineTo(0, size.height * lineTo)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * controlPoint, size.width, size.height * lineTo)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
