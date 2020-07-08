import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  final bool isSidebarOpened = false;
  final _animationDuration = Duration(milliseconds: 500);
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _animationDuration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      duration: _animationDuration,
      top: 0,
      bottom: 0,
      left: isSidebarOpened ? 0 : 0,
      right: isSidebarOpened ? 0 : size.width - 40,
      child: Container(
        width: size.width,
        height: size.height,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(0xff262AAA),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.9),
              child: Container(
                width: 35,
                height: 110,
                color: Color(0xff262AAA),
              ),
            )
          ],
        ),
      ),
    );
  }
}
