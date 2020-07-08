import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String text;

  const HomePage({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
