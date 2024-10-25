import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/config/app_colors.dart';
import 'package:movies_app/widgets/bounce_wrapper.dart';

class MarkAsFavoriteButton extends StatelessWidget {
  const MarkAsFavoriteButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isFavorite,
  });

  final String label;
  final bool isFavorite;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 50,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: FaIcon(
                  isFavorite ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                  color: isFavorite ? AppColors.primaryColor : Colors.black54,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: BounceWrapper(
                onPressed: onPressed,
                child: Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
