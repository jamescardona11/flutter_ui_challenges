import 'package:flutter/material.dart';

class ToDoItem {
  final String name;
  final String details;
  final bool remainder;
  final String time;
  final String detailTime;
  final Color color;

  const ToDoItem({
    required this.name,
    required this.details,
    required this.remainder,
    required this.time,
    required this.detailTime,
    required this.color,
  });
}
