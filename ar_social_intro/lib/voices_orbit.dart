import 'package:ar_social_intro/app_assets.dart';
import 'package:flutter/material.dart';

import 'voice_circle.dart';
import 'voice_circle_path.dart';

class VoicesOrbit extends StatefulWidget {
  const VoicesOrbit({
    Key? key,
  }) : super(key: key);

  @override
  State<VoicesOrbit> createState() => _VoicesOrbitState();
}

class _VoicesOrbitState extends State<VoicesOrbit> with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 30),
  );

  late Animation<double> rightRotationAnimation = controller.drive(Tween(begin: 1.0, end: 0.0));

  @override
  void initState() {
    super.initState();

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: CustomPaint(
            size: Size(size.width, size.width),
            painter: VoiceCirclePath(
              radius: _radius(size.width),
            ),
          ),
        ),
        ...circles
            .map((circle) => VoiceCircleWidget(
                  width: size.width / 2 - 40,
                  circle: circle,
                  rightRotationAnimation: rightRotationAnimation,
                  leftRotationAnimation: controller,
                ))
            .toList()
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<double> _radius(double width) => [
        radiusThree,
        radiusTwo,
        radiusOne,
      ];
}

double get radiusOne => 2 * _radiusDelta;
double get radiusTwo => _radiusDelta;
double get radiusThree => 0;
double get _radiusDelta => 20 + 2 * 50 / 3;

List<VoiceCircle> get circles => [
      VoiceCircle(
        size: 50,
        color: const Color(0xffB0A8C4),
        initialPosition: const Offset(100, 0),
        initialRadius: radiusOne,
        image: AppAssets.imageElli,
        normalRotation: false,
      ),
      VoiceCircle(
        size: 55,
        color: const Color(0xffE8FFB6),
        initialPosition: const Offset(-100, 100),
        initialRadius: radiusOne,
        image: AppAssets.imageAdam,
        normalRotation: false,
      ),
      VoiceCircle(
        size: 60,
        color: const Color(0xffE97073),
        initialPosition: const Offset(0, -100),
        initialRadius: radiusOne,
        image: AppAssets.imageBella,
        normalRotation: false,
      ),
      VoiceCircle(
        size: 45,
        color: const Color(0xff4E9463),
        initialPosition: const Offset(100, -100),
        initialRadius: radiusTwo,
        normalRotation: false,
      ),
      VoiceCircle(
        size: 30,
        color: const Color(0xffFFEC33),
        initialPosition: const Offset(0, 100),
        initialRadius: radiusTwo,
        normalRotation: false,
      ),
      VoiceCircle(
        size: 25,
        color: const Color(0xffC4C1FF),
        initialPosition: const Offset(-180, 0),
        initialRadius: radiusTwo,
        normalRotation: false,
      ),
      VoiceCircle(
        size: 60,
        color: const Color(0xffFC7B37),
        initialRadius: radiusThree,
        image: AppAssets.imageArnold,
      ),
      VoiceCircle(
        size: 60,
        color: const Color(0xffA79FFB),
        initialPosition: const Offset(-50, 50),
        initialRadius: radiusThree,
        image: AppAssets.imageDomi,
      ),
      VoiceCircle(
        size: 20,
        color: const Color(0xffFD893C),
        initialPosition: const Offset(-120, 30),
        initialRadius: radiusThree,
      ),
      VoiceCircle(
        size: 70,
        color: const Color(0xffFFEC33),
        initialPosition: const Offset(-120, -50),
        initialRadius: radiusThree,
        image: AppAssets.imageJosh,
      ),
      VoiceCircle(
        size: 80,
        color: const Color(0xffEC9DFF),
        initialPosition: const Offset(-40, -180),
        initialRadius: radiusThree,
        image: AppAssets.imageRachel,
      ),
      VoiceCircle(
        size: 44,
        color: const Color(0xff9388FF),
        initialPosition: const Offset(30, -80),
        initialRadius: radiusThree,
      ),
      VoiceCircle(
        size: 80,
        color: const Color(0xff4E9463),
        initialPosition: const Offset(30, -10),
        initialRadius: radiusThree,
        image: AppAssets.imageSam,
      ),
      VoiceCircle(
        size: 44,
        color: const Color(0xffEC9DFF),
        initialPosition: const Offset(30, 50),
        initialRadius: radiusThree,
      ),
      VoiceCircle(
        size: 50,
        color: const Color(0xFF18314F),
        initialPosition: const Offset(30, 15),
        initialRadius: radiusThree,
        image: AppAssets.imageAntoni,
      ),
    ];
