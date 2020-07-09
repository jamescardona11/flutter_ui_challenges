import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;

  const InputTextField({
    Key key,
    @required this.hint,
    @required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFBC7C7C7),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          icon: Icon(
            icon,
            color: kHeadingColor,
          ),
          border: InputBorder.none,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
