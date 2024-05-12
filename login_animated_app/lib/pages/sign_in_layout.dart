import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';
import 'package:login_animated_app/widgets/RoundedCustomButton.dart';
import 'package:login_animated_app/widgets/input_card.dart';
import 'package:login_animated_app/widgets/input_text_field.dart';

class SignInLayout extends StatelessWidget {
  final VoidCallback loginOnPress, newAccountOnPress;

  const SignInLayout({
    Key? key,
    required this.loginOnPress,
    required this.newAccountOnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: InputCad(
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
                onPress: loginOnPress,
                content: 'Login',
                width: size.width * 0.7,
                filled: true,
              ),
              SizedBox(height: size.height * 0.015),
              RoundedCustomButton(
                onPress: newAccountOnPress,
                content: 'Create a new account',
                width: size.width * 0.7,
                filled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
