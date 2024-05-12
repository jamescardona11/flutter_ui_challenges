import 'package:flutter/material.dart';

class CircleAvatarApp extends StatelessWidget {
  final String imageUrl;
  final nameLetter;

  const CircleAvatarApp({
    Key? key,
    required this.imageUrl,
    required this.nameLetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(imageUrl),
      backgroundColor: Color(0xFFFEF9EB),
      child: imageUrl.isNotEmpty
          ? null
          : Text(
              nameLetter,
              style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
    );
  }
}
