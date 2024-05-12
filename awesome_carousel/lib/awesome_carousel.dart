import 'dart:ui';

import 'package:awesome_carousel/assets.dart';
import 'package:flutter/material.dart';

import 'basic_card.dart';

// https://dribbble.com/shots/14139308-Simple-Scroll-Animation/attachments/5763653?mode=media
class AwesomeCarouselPage extends StatefulWidget {
  const AwesomeCarouselPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AwesomeCarouselPage> createState() => _AwesomeCarouselPageState();
}

class _AwesomeCarouselPageState extends State<AwesomeCarouselPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<String>(tokList[currentPage]),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(tokList[currentPage]),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.5,
            child: PageView.builder(
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemCount: tokList.length,
              itemBuilder: ((_, index) {
                return FractionallySizedBox(widthFactor: 0.8, child: BasicCard(image: tokList[index]));
              }),
            ),
          )
        ],
      ),
    );
  }
}
