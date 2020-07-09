import 'package:flutter/material.dart';
import 'package:login_animated_app/widgets/input_card.dart';

class SignInLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InputCad(
      width: size.width,
      height: size.height * 0.65,
    );
  }
}
