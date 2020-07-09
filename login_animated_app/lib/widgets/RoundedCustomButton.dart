import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';

class RoundedCustomButton extends StatelessWidget {
  final double width, height;
  final bool filled;
  final String content;
  final VoidCallback onPress;

  const RoundedCustomButton({
    Key key,
    this.width = 250,
    this.height = 55,
    this.filled = true,
    this.content = 'Press me',
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: kHeadingColor,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          color: filled ? kHeadingColor : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 3),
              blurRadius: 5,
              spreadRadius: -3.0,
            ),
          ],
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
      ),
    );
  }
}
