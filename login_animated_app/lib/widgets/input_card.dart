import 'package:flutter/material.dart';

class InputCad extends StatefulWidget {
  final Widget child;

  const InputCad({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _InputCadState createState() => _InputCadState();
}

class _InputCadState extends State<InputCad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: widget.child,
    );
  }
}
