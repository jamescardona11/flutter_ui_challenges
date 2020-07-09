import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';
import 'package:login_animated_app/widgets/RoundedCustomButton.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.15),
            const Text(
              'Learn Free',
              style: TextStyle(
                color: kHeadingColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: const Text(
                'We make learning easy. Follow @jamescardona11 to learn flutter for free.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kHeadingColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Image(
              image: AssetImage('assets/images/splash_bg.png'),
              width: size.width * 0.7,
            ),
            Expanded(child: SizedBox()),
            RoundedCustomButton(),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
