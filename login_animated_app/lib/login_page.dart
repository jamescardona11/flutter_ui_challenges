import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';
import 'package:login_animated_app/pages/sign_in_layout.dart';
import 'package:login_animated_app/pages/sign_up_layout.dart';
import 'package:login_animated_app/pages/splash_layout.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _opacity;
  Animation<double> _widthContainer;
  final Duration duration = Duration(milliseconds: 1000);
  final Duration positionDuration = Duration(milliseconds: 500);

  final animatedSignInPosition = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    _opacity = Tween(begin: 1.0, end: 0.7).animate(_animationController);
    _widthContainer = Tween(begin: 0.0, end: 25.0).animate(_animationController);

    _animationController.addListener(() {
      //print('${_widthContainer.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SplashLayout(
            isShowInputCard: true,
          ),
          ValueListenableBuilder(
            valueListenable: animatedSignInPosition,
            builder: (_, value, child) {
              print('VALUE: $value');
              return AnimatedPositioned(
                duration: positionDuration,
                bottom: value ? 20 : 0,
                left: value ? 25 : 0,
                right: value ? 25 : 0,
                child: child,
              );
            },
            child: FadeTransition(
              opacity: _opacity,
              child: Container(
                width: size.width,
                height: size.height * 0.65,
                child: SignInLayout(
                  loginOnPress: () {
                    animatedSignInPosition.value = false;
                    _animationController.reverse();
                  },
                  newAccountOnPress: () {
                    animatedSignInPosition.value = true;
                    _animationController.forward();
                  },
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: animatedSignInPosition,
            builder: (_, value, child) => AnimatedPositioned(
              duration: positionDuration,
              bottom: value ? 0 : -size.height * 0.65,
              child: Container(
                width: size.width,
                height: size.height * 0.65,
                child: SignUpLayout(
                  createOnPress: () {
                    animatedSignInPosition.value = false;
                    _animationController.reverse();
                  },
                  backOnPress: () {
                    animatedSignInPosition.value = true;
                    _animationController.forward();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
