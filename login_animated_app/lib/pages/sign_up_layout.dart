import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';
import 'package:login_animated_app/widgets/RoundedCustomButton.dart';
import 'package:login_animated_app/widgets/input_card.dart';
import 'package:login_animated_app/widgets/input_text_field.dart';

class SignUpLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InputCad(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Create a new account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: kHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            InputTextField(
              hint: 'Enter your email',
              icon: Icons.email,
            ),
            InputTextField(
              hint: 'Enter your password',
              icon: Icons.lock,
              obscureText: true,
            ),
            Expanded(child: SizedBox.shrink()),
            RoundedCustomButton(
              onPress: () {},
              content: 'Create Account',
              width: size.width * 0.7,
              filled: true,
            ),
            SizedBox(height: size.height * 0.015),
            RoundedCustomButton(
              onPress: () {},
              content: 'Back to Login',
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
