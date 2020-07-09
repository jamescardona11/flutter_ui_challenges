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
  final Duration duration = Duration(milliseconds: 1000);
  final Duration positionDuration = Duration(milliseconds: 500);

  final openSignUpPosition = ValueNotifier<bool>(false);
  final openSignInPosition = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    _opacity = Tween(begin: 1.0, end: 0.7).animate(_animationController);
    _animationController.addListener(() {
      //print('${_widthContainer.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        onTap: (){},
        child: Stack(
          children: [
            SplashLayout(
              isShowInputCard: true,
              getStarted: () {
                openSignInPosition.value = true;
              },
            ),
            ValueListenableBuilder(
              valueListenable: openSignInPosition,
              builder: (context, openSignIn, child) => ValueListenableBuilder(
                valueListenable: openSignUpPosition,
                builder: (_, openSignUp, child) {
                  return AnimatedPositioned(
                    duration: positionDuration,
                    bottom: openSignIn ? openSignUp ? 20 : 0 : -size.height * 0.65,
                    left: openSignUp ? 25 : 0,
                    right: openSignUp ? 25 : 0,
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
                        openSignUpPosition.value = false;
                        _animationController.reverse();
                      },
                      newAccountOnPress: () {
                        openSignUpPosition.value = true;
                        _animationController.forward();
                      },
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: openSignUpPosition,
              builder: (_, value, child) => AnimatedPositioned(
                duration: positionDuration,
                bottom: value ? 0 : -size.height * 0.65,
                child: Container(
                  width: size.width,
                  height: size.height * 0.65,
                  child: SignUpLayout(
                    createOnPress: () {},
                    backOnPress: () {
                      openSignUpPosition.value = false;
                      _animationController.reverse();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
