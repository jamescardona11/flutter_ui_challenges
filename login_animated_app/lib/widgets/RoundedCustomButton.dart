import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';

class RoundedCustomButton extends StatelessWidget {
  final double width, height;
  final bool filled;
  final String content;

  const RoundedCustomButton({
    Key key,
    this.width = 250,
    this.height = 55,
    this.filled = true,
    this.content = 'Press me',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: kHeadingColor,
          style: BorderStyle.solid,
          width: 3,
        ),
        color: filled ? kHeadingColor : Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            color: !filled ? kHeadingColor : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
