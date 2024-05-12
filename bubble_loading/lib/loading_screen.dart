import 'dart:math';

import 'package:flutter/material.dart';

//https://dribbble.com/shots/14054408-Data-Backup-Animation

const mainColor = Color(0xff5113AA);
const secondaryColor = Color(0xffbc53fa);
const backgroundColor = Color(0xfffce7fe);

const _duration = Duration(milliseconds: 500);

class LoadingScreenPage extends StatefulWidget {
  const LoadingScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingScreenPage> createState() => _LoadingScreenPageState();
}

class _LoadingScreenPageState extends State<LoadingScreenPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> progressAnimation;
  late Animation<double> cloudOutAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    progressAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 0.65),
    );

    cloudOutAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.7, 0.85),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          InitialView(
            progressAnimation: progressAnimation,
            onAnimationStarted: () {
              animationController.forward();
            },
          ),
          CloudView(
            progressAnimation: progressAnimation,
            cloudOutAnimation: cloudOutAnimation,
          )
        ],
      ),
    );
  }
}

enum LoadingState {
  initial,
  start,
  end,
}

class InitialView extends StatefulWidget {
  const InitialView({
    Key? key,
    required this.onAnimationStarted,
    required this.progressAnimation,
  }) : super(key: key);

  final VoidCallback onAnimationStarted;
  final Animation<double> progressAnimation;

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  LoadingState currentState = LoadingState.initial;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              flex: 3,
              child: Text(
                'Cloud Storage',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            if (currentState == LoadingState.end)
              Expanded(
                flex: 2,
                child: TweenAnimationBuilder<double>(
                  duration: _duration,
                  tween: Tween(
                    begin: 0.0,
                    end: 1.0,
                  ),
                  builder: (_, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'uploading files',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      // SizedBox(height: 20),
                      Expanded(
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: ProgressContainer(
                              progressAnimation: widget.progressAnimation,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (currentState != LoadingState.end)
              Expanded(
                flex: 2,
                child: TweenAnimationBuilder<double>(
                  duration: _duration,
                  tween: Tween(
                    begin: 1.0,
                    end: currentState != LoadingState.initial ? 0.0 : 1.0,
                  ),
                  onEnd: () {
                    setState(() {
                      currentState = LoadingState.end;
                    });
                  },
                  builder: (_, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0.0, 50 * value),
                        child: child,
                      ),
                    );
                  },
                  child: const Column(
                    children: [
                      Text(
                        'last backkup',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '28 march 2022',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedSwitcher(
                duration: _duration,
                child: currentState == LoadingState.initial
                    ? SizedBox(
                        width: size.width,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: mainColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              currentState = LoadingState.start;
                            });

                            widget.onAnimationStarted();
                          },
                          child: const Text('Create Backupd'),
                        ),
                      )
                    : OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                          child: Text('Button'),
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

class CloudView extends StatelessWidget {
  CloudView({
    Key? key,
    required this.progressAnimation,
    required this.cloudOutAnimation,
  }) : super(key: key);

  final Animation<double> progressAnimation;
  final Animation<double> cloudOutAnimation;

  final particles = List<Particle>.generate(500, (index) {
    return Particle(
      color: Random().nextBool() ? mainColor : secondaryColor,
      radius: Random().nextInt(20) + 5,
      speed: Random().nextInt(50) + 1,
      direction: Random().nextInt(250) * (Random().nextBool() ? 1 : -1),
      initialPosition: index * 10,
    );
  });

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: Listenable.merge([progressAnimation, cloudOutAnimation]),
      builder: (_, child) {
        final radius1 = query.width * 0.5;
        final radius2 = radius1 * 0.6;
        final radius3 = radius1 * 0.7;

        return Positioned(
          left: 0,
          right: 0,
          top: 180 * (1 - progressAnimation.value),
          bottom: query.height * 0.4,
          child: CustomPaint(
            painter: CloudPainter(
              radius1: radius1,
              radius3: radius3,
              radius2: radius2,
              animation: progressAnimation,
              particles: particles,
            ),
          ),
        );
      },
    );
  }
}

class ProgressContainer extends AnimatedWidget {
  const ProgressContainer({
    Key? key,
    required Animation<double> progressAnimation,
  }) : super(key: key, listenable: progressAnimation);

  double get value => (listenable as Animation<double>).value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(value * 100).toStringAsFixed(0)}%',
      style: const TextStyle(
        fontSize: 17,
        color: Colors.black87,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class Particle {
  Particle({
    required this.color,
    required this.direction,
    required this.speed,
    required this.radius,
    required this.initialPosition,
  });

  final Color color;
  final double direction;
  final double speed;
  final double radius;
  final int initialPosition;
}

class CloudPainter extends CustomPainter {
  CloudPainter({
    required this.radius1,
    required this.radius2,
    required this.radius3,
    required this.animation,
    required this.particles,
  }) : super(repaint: animation);

  final double radius1;
  final double radius2;
  final double radius3;
  final Animation<double> animation;
  final List<Particle> particles;

  final myPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  final myPaint2 = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

  @override
  void paint(Canvas canvas, Size size) {
    final delta = 1 - animation.value;

    final path = Path();
    final path2 = Path();

    final rad1 = delta * radius1 / 2;
    final rad2 = delta * radius2 / 2;
    final rad3 = delta * radius3 / 2;

    print(delta);
    path.addOval(
      Rect.fromCircle(
        center: Offset(
          size.width * 0.5,
          size.height * (0.5 - 0.1 * (1 - delta)),
        ),
        radius: radius1 * (1 - delta + 0.5),
      ),
    );

    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width * 0.25, size.height * 0.62),
        radius: rad2,
      ),
    );

    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width * 0.75, size.height * 0.59),
        radius: rad3,
      ),
    );

    canvas.drawPath(path, myPaint);

    path2.moveTo(size.width / 2 - rad1, size.height / 2 + rad1 - 9);
    path2.lineTo(size.width / 2 + rad1, size.height / 2 + rad1 - 9);

    canvas.drawPath(path2, myPaint2);

    if (delta != 1.0) {
      particles.forEach((p) {
        if (p.initialPosition == 0) print(size.height * 0.5 * delta - p.speed * (1 - delta) + p.initialPosition * delta + 70);

        final paint = Paint()..color = p.color;
        final off = Offset(
          size.width / 2 + p.direction * (1 - delta),
          size.height * 0.5 * delta - p.speed * (1 - delta) + p.initialPosition * delta + 70,
        );

        if (off.dy < 233) {
          canvas.drawCircle(
            off,
            p.radius,
            paint,
          );
        }
      });
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CloudPainter2 extends CustomPainter {
  CloudPainter2({
    required this.radius1,
    required this.radius2,
    required this.radius3,
    required this.animation,
    required this.particles,
  }) : super(repaint: animation);

  final double radius1;
  final double radius2;
  final double radius3;
  final Animation<double> animation;
  final List<Particle> particles;

  final myPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  final myPaint2 = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

  @override
  void paint(Canvas canvas, Size size) {
    final delta = 1 - animation.value;

    particles.forEach((p) {
      final paint = Paint()..color = p.color;
      final off = Offset(
        size.width / 2 + p.direction * (1 - delta),
        size.height * 0.5 * delta - p.speed * (1 - delta) + p.initialPosition * delta,
      );
      canvas.drawCircle(
        off,
        p.radius,
        paint,
      );
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
