import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/leftbar_layout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LeftBarLayout(),
        ],
      ),
    );
  }
}
