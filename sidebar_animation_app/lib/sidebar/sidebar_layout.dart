import 'package:flutter/material.dart';
import 'package:sidebar_animation_app/pages/home_page.dart';
import 'package:sidebar_animation_app/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          SideBar(),
        ],
      ),
    );
  }
}
