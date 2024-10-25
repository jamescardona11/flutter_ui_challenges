import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/config/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroInfoBoxWidget extends StatelessWidget {
  const IntroInfoBoxWidget({
    super.key,
    required this.pageIndex,
    required this.controller,
  });

  final int pageIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 341,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AnimatedDefaultTextStyle(
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      titles[pageIndex],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    subs[pageIndex],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      spacing: 8.0,
                      radius: 7.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      strokeWidth: 1.5,
                      dotColor: AppColors.primaryColor.withOpacity(0.2),
                      activeDotColor: AppColors.primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> get titles => [
        'Welcome to the Cinematic Universe!',
        'Lights, Camera, Action!',
      ];

  List<String> get subs => [
        'Dive into a world of storytelling where every frame tells a tale, and every character has a journey. Explore our latest releases, discover hidden gems, and experience the magic of cinema like never before!',
        'Get ready to embark on an unforgettable adventure through the silver screen. From thrilling blockbusters to heartwarming dramas, find your next favorite film and let the storytelling begin!',
      ];
}
