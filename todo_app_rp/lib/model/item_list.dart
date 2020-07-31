import 'package:flutter/material.dart';

class ItemList {
  final String name;
  final int numberOfTask;
  final int completeTask;
  final IconData icon;
  final Color color;

  const ItemList({
    @required this.name,
    @required this.numberOfTask,
    @required this.completeTask,
    @required this.icon,
    @required this.color,
  });

  String get itemsTxt {
    final finalLetter = numberOfTask > 1 ? ' tasks' : ' task';
    return numberOfTask.toString() + finalLetter;
  }

  double get percent {
    return (completeTask / numberOfTask) * 100;
  }

  int get leftTask {
    return numberOfTask - completeTask;
  }
}
