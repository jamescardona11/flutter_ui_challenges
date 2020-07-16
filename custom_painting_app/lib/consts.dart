import 'package:flutter/material.dart';

final kDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      blurRadius: 5.0,
      spreadRadius: 1.0,
    )
  ],
);
