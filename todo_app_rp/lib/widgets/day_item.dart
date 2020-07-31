import 'package:flutter/material.dart';
import 'package:todo_app_rp/consts.dart';
import 'package:todo_app_rp/utils.dart';

class DayItem extends StatelessWidget {
  final bool selectedItem;
  final int day;

  const DayItem({
    Key key,
    this.selectedItem = false,
    @required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      padding: const EdgeInsets.all(8.0),
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: selectedItem ? Theme.of(context).primaryColor : Colors.white,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1.5,
        ),
        borderRadius: kBorderRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              dayName(day + 1),
              style: TextStyle(
                color: selectedItem ? Colors.white : Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${day + 1}',
              style: TextStyle(
                color: selectedItem ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
