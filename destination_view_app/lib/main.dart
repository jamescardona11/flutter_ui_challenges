import 'package:flutter/material.dart';

import 'black_view.dart';
import 'full_screen_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FullScreenPage(),
    );
  }
}
