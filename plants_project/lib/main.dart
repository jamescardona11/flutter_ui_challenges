import 'package:flutter/material.dart';

import 'pages/home_page.dart';

// Credit
// https://dribbble.com/shots/9328506-Freebie-Plant-Shop-App-Design

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
