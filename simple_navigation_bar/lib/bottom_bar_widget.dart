import 'package:flutter/material.dart';

import 'circle_indicator.dart';
import 'constants.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<AlignmentGeometry> alignmentAnimation;
  late Tween<AlignmentGeometry> alignmentTween;

  int lastItemSelected = 0;
  List<ItemBottomBarWidget> listInternalItems = [];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: duration);

    final startAlignment = calculateAlignment(lastItemSelected);
    alignmentTween = Tween(
      begin: startAlignment,
      end: startAlignment,
    );

    alignmentAnimation = alignmentTween.animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    initListItems();

    return SizedBox(
      height: topSize,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: barSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -1),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ),
          AlignTransition(
            alignment: alignmentAnimation,
            heightFactor: 1,
            child: FractionallySizedBox(
              widthFactor: 1 / length,
              child: Align(
                alignment: Alignment.topCenter,
                child: CustomPaint(
                  painter: CirclePainter(),
                  size: const Size(circleSize, circleSize),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: listInternalItems,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void initListItems() {
    listInternalItems = [
      ItemBottomBarWidget(
        animationController:
            AnimationController(vsync: this, duration: duration),
        iconData: Icons.home,
        position: 0,
        isSelected: lastItemSelected == 0,
        text: 'Home',
        onTap: forwardAndReverse,
      ),
      ItemBottomBarWidget(
        animationController:
            AnimationController(vsync: this, duration: duration),
        iconData: Icons.search,
        position: 1,
        text: 'Search',
        isSelected: lastItemSelected == 1,
        onTap: forwardAndReverse,
      ),
      ItemBottomBarWidget(
        animationController:
            AnimationController(vsync: this, duration: duration),
        iconData: Icons.person,
        position: 2,
        text: 'Profile',
        isSelected: lastItemSelected == 2,
        onTap: forwardAndReverse,
      ),
    ];
  }

  void initCircleAnimationAndStart(
      AlignmentGeometry fromAlign, Alignment toAlign) {
    alignmentTween.begin = fromAlign;
    alignmentTween.end = toAlign;
    animationController.reset();
    animationController.forward();
  }

  void forwardAndReverse(int selectedItem) {
    if (selectedItem != lastItemSelected) {
      forwardOrReverseItem(listInternalItems[selectedItem].animationController);
      listInternalItems[lastItemSelected].animationController.reverse();

      initCircleAnimationAndStart(
          alignmentAnimation.value, calculateAlignment(selectedItem));

      lastItemSelected = selectedItem;
    }
  }

  void forwardOrReverseItem(AnimationController animationController) {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (animationController.status != AnimationStatus.completed) {
      animationController.forward();
    }
  }

  Alignment calculateAlignment(int position) {
    const delta = 2 / (length - 1);
    return Alignment(position * delta - 1.0, 1.0);
  }
}

class ItemBottomBarWidget extends StatefulWidget {
  const ItemBottomBarWidget({
    Key? key,
    required this.iconData,
    required this.animationController,
    required this.position,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final AnimationController animationController;
  final IconData iconData;
  final int position;
  final String text;
  final bool isSelected;
  final Function(int) onTap;

  @override
  _ItemBottomBarWidgetState createState() => _ItemBottomBarWidgetState();
}

class _ItemBottomBarWidgetState extends State<ItemBottomBarWidget> {
  late Animation<double> opacityAnimation;
  late Animation<Offset> positionIconAnimation;
  late Animation<Color?> colorIconAnimation;

  @override
  void initState() {
    super.initState();
    const yIcon = topSize - barSize;

    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.easeOut,
        ),
      ),
    );

    positionIconAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(0, -yIcon)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeIn,
      ),
    );

    colorIconAnimation =
        ColorTween(begin: Colors.deepPurple, end: Colors.white).animate(
      CurvedAnimation(parent: widget.animationController, curve: Curves.easeIn),
    );

    if (widget.isSelected) widget.animationController.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.position);
      },
      child: SizedBox(
        width: size.width / length,
        height: barSize,
        child: AnimatedBuilder(
          animation: widget.animationController,
          builder: (_, c) => Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: positionIconAnimation.value,
                child: Icon(
                  widget.iconData,
                  size: iconSize,
                  color: colorIconAnimation.value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
