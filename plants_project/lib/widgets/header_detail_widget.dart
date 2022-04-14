import 'package:flutter/material.dart';
import 'package:plants_project/widgets/oval_clipper.dart';

import '../utils_plants.dart';

class HeaderDetailWidget extends StatelessWidget {
  const HeaderDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: OvalHeaderClipper(expand: false),
      child: Container(
        width: size.width,
        height: size.height * 0.18,
        color: greenPlantsColor,
        child: SafeArea(
          bottom: false,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get style14 => const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      );
}
