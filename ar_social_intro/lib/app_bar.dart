import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    this.onTapBack,
    this.title,
  }) : super(key: key);

  final VoidCallback? onTapBack;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: size.width,
        height: 50,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: GestureDetector(
                onTap: onTapBack,
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: -2,
                          offset: Offset(1, 1),
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff191168),
                    ),
                  ),
                ),
              ),
            ),
            Align(child: title),
          ],
        ),
      ),
    );
  }
}
