import 'package:flutter/material.dart';
import 'package:plants_project/utils_plants.dart';

class CircularButtonWidget extends StatelessWidget {
  const CircularButtonWidget({
    Key? key,
    this.back = false,
    required this.onPressed,
  }) : super(key: key);

  final bool back;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: greenDarkPlantsColor,
      ),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Icon(
          back ? Icons.arrow_back : Icons.arrow_forward,
        ),
      ),
    );
  }
}
