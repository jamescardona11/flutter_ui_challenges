import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_card_concept/assets.dart';

import 'basic_card.dart';

/// https://dribbble.com/shots/3844950-Story-App-Concept
final cardAspectRatio = 12.0 / 16.0;
final widgetAspectRatio = cardAspectRatio * 1.2;

class StoryCardConceptPage extends StatefulWidget {
  const StoryCardConceptPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryCardConceptPage> createState() => _StoryCardConceptPageState();
}

class _StoryCardConceptPageState extends State<StoryCardConceptPage> {
  int currentPage = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: currentPage);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.floor();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(0.85),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _HeaderWidget(),
                  Container(
                    height: 400,
                    padding: const EdgeInsets.only(
                      top: 28,
                      right: 28,
                    ),
                    child: PageView.builder(
                      itemCount: luiList.length,
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                        ),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..setEntry(3, 2, 0.001),
                          child: BasicCard(
                            image: luiList[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Favourite",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 46.0,
                              fontFamily: "Calibre-Semibold",
                              letterSpacing: 1.0,
                            )),
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_option_key,
                            size: 12.0,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22.0, vertical: 6.0),
                              child: Text("Latest",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text("9+ Stories",
                            style: TextStyle(color: Colors.blueAccent))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(lui1, width: 296.0, height: 222.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  CardScrollWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;
  double padding = 20;
  var verticalInset = 20.0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxWidth;
          final safeWidth = width - 2 * padding;
          final safeHeight = height - 2 * padding;

          final heightOfPrimaryCard = safeHeight;
          final widthOfPrimaryCard = safeWidth * cardAspectRatio;

          final primaryCardLeft = safeWidth - widthOfPrimaryCard;
          final horizontalInset = primaryCardLeft / 2;
          List<Widget> cardList = [];
          for (var i = 0; i < luiList.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0)
                  ]),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(luiList[i], fit: BoxFit.cover),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text('Title $i',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontFamily: "SF-Pro-Text-Regular")),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text("Read Later",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Trending',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.more_horiz_outlined,
              color: Colors.white,
              size: 35,
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 100,
              padding: const EdgeInsets.all(4),
              decoration: ShapeDecoration(
                color: Colors.deepOrange,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.deepOrange),
                ),
              ),
              child: Text(
                'Animated',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              '25+ stories',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
