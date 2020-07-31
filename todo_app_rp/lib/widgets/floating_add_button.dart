import 'package:flutter/material.dart';

class FloatingAddButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {},
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 45,
      ),
    );
  }
}
