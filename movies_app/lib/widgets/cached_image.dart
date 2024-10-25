import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/config/app_colors.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.radius = 0,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    this.fit = BoxFit.fill,
  });

  final String imageUrl;
  final double radius;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: getBorderRadius(),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) {
          return Container(
            color: AppColors.primaryColor,
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            color: Theme.of(context).colorScheme.error,
          );
        },
        fit: fit,
      ),
    );
  }

  BorderRadius getBorderRadius() {
    BorderRadius borderRadius = BorderRadius.zero;
    if (radius > 0) {
      borderRadius = BorderRadius.all(
        Radius.circular(radius),
      );
    } else if (topLeftRadius > 0) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(topLeftRadius),
      );
    } else if (topRightRadius > 0) {
      borderRadius = BorderRadius.only(
        topRight: Radius.circular(topRightRadius),
      );
    } else if (bottomLeftRadius > 0) {
      borderRadius = BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeftRadius),
      );
    } else if (bottomRightRadius > 0) {
      borderRadius = BorderRadius.only(
        bottomRight: Radius.circular(bottomRightRadius),
      );
    }

    return borderRadius;
  }
}
