import 'package:flutter/material.dart';
import 'package:todo_app_rp/consts.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: kStyleName.copyWith(fontSize: 18),
      ),
    );
  }
}
