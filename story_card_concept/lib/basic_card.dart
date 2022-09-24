import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({
    Key? key,
    required this.image,
    this.color = Colors.black87,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(25);
    return PhysicalModel(
      elevation: 10,
      color: color,
      borderRadius: border,
      child: ClipRRect(
        borderRadius: border,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
