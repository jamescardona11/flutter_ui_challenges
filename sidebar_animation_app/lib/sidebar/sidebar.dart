import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final _animationDuration = Duration(milliseconds: 500);
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSideBarOpenStream;
  StreamSink<bool> isSideBarOpenSink;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _animationDuration);

    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenStream = isSidebarOpenedStreamController.stream;
    isSideBarOpenSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _controller?.dispose();
    isSidebarOpenedStreamController?.close();
    isSideBarOpenSink?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
      initialData: false,
      stream: isSideBarOpenStream,
      builder: (context, snapshot) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: snapshot.data ? 0 : 0,
          right: snapshot.data ? 0 : size.width - 40,
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
                  child: GestureDetector(
                    onTap: () {
                      final animationStatus = _controller.status;
                      final isAnimationCompleted = animationStatus == AnimationStatus.completed;

                      if (isAnimationCompleted) {
                        isSideBarOpenSink.add(false);
                        _controller.reverse();
                      } else {
                        isSideBarOpenSink.add(true);
                        _controller.forward();
                      }
                    },
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xff262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _controller.view,
                        color: Color(0xff1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
