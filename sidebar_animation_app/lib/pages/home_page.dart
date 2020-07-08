import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //static const String pageRoute = 'home_page_route_id';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'Home Page',
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
