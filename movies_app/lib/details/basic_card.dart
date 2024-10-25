import 'package:flutter/material.dart';
import 'package:movies_app/widgets/cached_image.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({
    super.key,
    required this.imageUrl,
    this.color = Colors.black87,
    this.width,
    this.height,
    required this.id,
  });

  final double? width;
  final double? height;
  final String imageUrl;
  final Color color;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: PhysicalModel(
        elevation: 10,
        color: color,
        borderRadius: BorderRadius.circular(25),
        child: CachedImage(
          imageUrl: imageUrl,
          radius: 8,
        ),
      ),
    );
  }
}
