import 'package:flutter/material.dart';

AppBar myappbar(BuildContext context, [back = true, color = Colors.grey]) =>
    AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (back) Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: color,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.share,
            color: color,
          ),
        ),
        Icon(
          Icons.favorite_border,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 8),
          child: Icon(
            Icons.more_horiz,
            color: color,
          ),
        ),
      ],
    );
