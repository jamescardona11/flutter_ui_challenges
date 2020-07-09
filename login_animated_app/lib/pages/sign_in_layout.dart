import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';
import 'package:login_animated_app/widgets/RoundedCustomButton.dart';
import 'package:login_animated_app/widgets/input_card.dart';

class SignInLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InputCad(
      width: size.width,
      height: size.height * 0.65,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: kHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            _InputTextField(
              hint: 'Enter your email',
              icon: Icons.email,
            ),
            _InputTextField(
              hint: 'Enter your password',
              icon: Icons.lock,
              obscureText: true,
            ),
            Expanded(child: SizedBox.shrink()),
            RoundedCustomButton(
              onPress: () {},
              content: 'Login',
              width: size.width * 0.7,
              filled: true,
            ),
            SizedBox(height: size.height * 0.015),
            RoundedCustomButton(
              onPress: () {},
              content: 'Create a new account',
              width: size.width * 0.7,
              filled: false,
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

class _InputTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;

  const _InputTextField({
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
