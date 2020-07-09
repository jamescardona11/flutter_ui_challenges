import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';
import 'package:login_animated_app/widgets/RoundedCustomButton.dart';

class SplashLayout extends StatelessWidget {
  final bool isShowInputCard;
  final VoidCallback getStarted;

  const SplashLayout({
    Key key,
    @required this.isShowInputCard,
    this.getStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.08),
          Text(
            'Learn Free',
            style: TextStyle(
              color: isShowInputCard ? Colors.white : kHeadingColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'We make learning easy. Follow @jamescardona11 to learn flutter for free.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isShowInputCard ? Colors.white : kHeadingColor,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.07),
          Image(
            image: AssetImage('assets/images/splash_bg.png'),
            width: size.width * 0.7,
          ),
          Expanded(child: SizedBox()),
          RoundedCustomButton(
            width: size.width * 0.7,
            filled: true,
            content: 'Get Started',
            onPress: getStarted,
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}
