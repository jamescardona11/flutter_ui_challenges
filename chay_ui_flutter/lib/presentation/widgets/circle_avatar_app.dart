import 'package:flutter/material.dart';

class CircleAvatarApp extends StatelessWidget {
  final String imageUrl;
  final nameLetter;

  const CircleAvatarApp({
    Key key,
    @required this.imageUrl,
    @required this.nameLetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(imageUrl),
      backgroundColor: Theme.of(context).accentColor,
      child: imageUrl.isNotEmpty
          ? null
          : Text(
              nameLetter,
              style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
    );
  }
}
