import 'package:flutter/material.dart';
import 'package:login_animated_app/constants.dart';
import 'package:login_animated_app/pages/sign_in_layout.dart';
import 'package:login_animated_app/pages/sign_up_layout.dart';
import 'package:login_animated_app/pages/splash_layout.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _animationControllerOpacity;
  Animation<double> _opacity;
  AnimationController _animationControllerColor;
  Animation<Color> _animatedColor;
  final Duration duration = Duration(milliseconds: 1000);
  final Duration positionDuration = Duration(milliseconds: 300);

  final openSignUpPosition = ValueNotifier<bool>(false);
  final openSignInPosition = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _animationControllerOpacity = AnimationController(
      vsync: this,
      duration: duration,
    );
    _animationControllerColor = AnimationController(
      vsync: this,
      duration: positionDuration,
    );
    _opacity = Tween(begin: 1.0, end: 0.7).animate(_animationControllerOpacity);
    _animatedColor = ColorTween(begin: Colors.white, end: kBackgroundColor).animate(_animationControllerColor);
    _animationControllerOpacity.addListener(() {
      print('${_animatedColor.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        print('CHICK');
        FocusScope.of(context).unfocus();
        openSignInPosition.value = false;
        _animationControllerColor.reverse();
      },
      child: ValueListenableBuilder(
        valueListenable: openSignInPosition,
        builder: (context, openSignIn, child) => AnimatedBuilder(
          animation: _animatedColor,
          builder: (context, child) => Scaffold(
            backgroundColor: _animatedColor.value,
            body: Stack(
              children: [
                SplashLayout(
                  isShowInputCard: openSignIn,
                  getStarted: () {
                    openSignInPosition.value = true;
                    _animationControllerColor.forward();
                  },
                ),
                ValueListenableBuilder(
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
                          _animationControllerOpacity.reverse();
                        },
                        newAccountOnPress: () {
                          openSignUpPosition.value = true;
                          _animationControllerOpacity.forward();
                        },
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
                          _animationControllerOpacity.reverse();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
