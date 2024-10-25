import 'package:flutter/material.dart';
import 'package:movies_app/home_page.dart';

import 'intro_info_box_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _IntroPage(),
    );
  }
}

class _IntroPage extends StatefulWidget {
  const _IntroPage({super.key});

  @override
  State<_IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<_IntroPage> {
  final PageController controller = PageController();
  bool readyToGoHome = false;

  int pageIndex = 0;

  List<Widget> pages = const [
    PageViewElement(assetPath: 'assets/intro1.png'),
    PageViewElement(assetPath: 'assets/intro2.png'),
    ColoredBox(color: Colors.black, child: SizedBox()),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: pages.length,
          itemBuilder: (context, index) => pages[index],
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            if (value == 2) {
              goToHome();
            }

            setState(() {
              pageIndex = value;
            });
          },
        ),
        if (pageIndex <= 1)
          IntroInfoBoxWidget(
            pageIndex: pageIndex,
            controller: controller,
          ),
      ],
    );
  }

  void goToHome() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}

class PageViewElement extends StatelessWidget {
  const PageViewElement({super.key, required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
