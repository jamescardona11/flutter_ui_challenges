import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/widgets/cached_image.dart';

class BackgroundDetailPage extends StatelessWidget {
  const BackgroundDetailPage({
    super.key,
    required this.id,
    required this.imageUrl,
  });

  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        CachedImage(
          key: ValueKey<String>(id.toString()),
          imageUrl: imageUrl,
          radius: 8,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
