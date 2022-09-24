import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:list_card_animation/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CardsPage(),
    );
  }
}

class CardsPage extends StatelessWidget {
  const CardsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'My PlayList',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Navigator.of(context).maybePop()),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ]),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CardBodyWidget(),
          ),
          Expanded(
            flex: 2,
            child: CardsHorizontalView(),
          ),
        ],
      ),
    );
  }
}

class CardsHorizontalView extends StatelessWidget {
  const CardsHorizontalView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Recently Played'),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cardList.length,
            itemBuilder: (_, index) {
              final card = cardList[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card3DWidget(card: card),
              );
            },
          ),
        )
      ],
    );
  }
}

class CardBodyWidget extends StatefulWidget {
  const CardBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CardBodyWidget> createState() => _CardBodyWidgetState();
}

class _CardBodyWidgetState extends State<CardBodyWidget>
    with TickerProviderStateMixin {
  bool _selectedMode = false;
  int? _selectedIndex;
  late AnimationController animationControllerSelection;
  late AnimationController animationControllerMovement;

  @override
  void initState() {
    animationControllerSelection = AnimationController(
      vsync: this,
      lowerBound: 0.15,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 880),
    );

    animationControllerMovement = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    animationControllerSelection.dispose();
    animationControllerMovement.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedBuilder(
          animation: animationControllerSelection,
          builder: (_, snapshot) => GestureDetector(
            onTap: () {
              if (!_selectedMode) {
                animationControllerSelection.forward().whenComplete(() {
                  setState(() {
                    _selectedMode = true;
                  });
                });
              } else {
                animationControllerSelection.reverse().whenComplete(() {
                  setState(() {
                    _selectedMode = false;
                  });
                });
              }
            },
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(animationControllerSelection.value),
              child: AbsorbPointer(
                absorbing: !_selectedMode,
                child: Container(
                  width: constraints.maxWidth * 0.45,
                  height: constraints.maxHeight,
                  child: AnimatedBuilder(
                    animation: animationControllerMovement,
                    builder: (_, snapshot) => Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ...List.generate(
                          4,
                          (index) => Card3DItem(
                            height: constraints.maxHeight / 2,
                            card: cardList[index],
                            percent: animationControllerSelection.value,
                            depth: index,
                            verticalFactor: _getCurrentVerticalFactor(index),
                            animation: animationControllerMovement,
                            onCardSelected: (card) {
                              _onCardSelected(card, index);
                            },
                          ),
                        ).reversed,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onCardSelected(Card3D card, int index) async {
    setState(() {
      _selectedIndex = index;
    });

    final duration = const Duration(milliseconds: 750);

    animationControllerMovement.forward();
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        pageBuilder: (context, animation, __) => FadeTransition(
          opacity: animation,
          child: CardsDetailsWidget(card: card),
        ),
      ),
    );
    animationControllerMovement.reverse(from: 1.0);
  }

  int _getCurrentVerticalFactor(int currentIndex) {
    if (_selectedIndex == null || _selectedIndex == currentIndex) {
      return 0;
    } else if (currentIndex > _selectedIndex!) {
      return -1;
    }

    return 1;
  }
}

class CardsDetailsWidget extends StatelessWidget {
  const CardsDetailsWidget({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Card3D card;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(15);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Hero(
              tag: card.title,
              child: PhysicalModel(
                elevation: 10,
                color: Colors.white,
                borderRadius: border,
                child: ClipRRect(
                  borderRadius: border,
                  child: Image.asset(
                    card.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Card3DItem extends StatelessWidget {
  final double height;
  final Card3D card;
  final double percent;
  final int depth;
  final int verticalFactor;
  final ValueChanged<Card3D>? onCardSelected;
  final Animation<double> animation;

  const Card3DItem({
    Key? key,
    required this.height,
    required this.card,
    required this.percent,
    required this.depth,
    this.onCardSelected,
    required this.verticalFactor,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final depthFactor = 50.0;
    final bottomMargin = height / 4;
    return Positioned(
      left: 0,
      right: 0,
      top: height + -depth * height / 2 * percent - bottomMargin,
      child: Opacity(
        //TODO Change this
        opacity: verticalFactor == 0 ? 1 : 1.0 - animation.value,
        child: Hero(
          tag: card.title,
          flightShuttleBuilder: (context, animation, flipDirection,
              fromHeroContext, toHeroContext) {
            Widget current;
            if (flipDirection == HeroFlightDirection.push) {
              current = toHeroContext.widget;
            } else {
              current = fromHeroContext.widget;
            }

            return AnimatedBuilder(
              animation: animation,
              builder: (context, snapshot) {
                final newValue = lerpDouble(0.0, 2 * pi, animation.value)!;
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateX(newValue),
                  child: current,
                );
              },
            );
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(
                0.0,
                verticalFactor *
                    animation.value *
                    MediaQuery.of(context).size.height,
                depth * depthFactor,
              ),
            child: InkWell(
              onTap: () {
                print('TAP Card');
                onCardSelected?.call(card);
              },
              child: SizedBox(
                height: height,
                child: Card3DWidget(card: card),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Card3DWidget extends StatelessWidget {
  const Card3DWidget({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Card3D card;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(15);
    return PhysicalModel(
      elevation: 10,
      color: Colors.black87,
      borderRadius: border,
      child: ClipRRect(
        borderRadius: border,
        child: Image.asset(
          card.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
