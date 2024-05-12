import 'package:flutter/material.dart';
import 'package:todo_app_rp/consts.dart';
import 'package:todo_app_rp/model/todo_item.dart';
import 'package:todo_app_rp/widgets/day_item.dart';
import 'package:todo_app_rp/widgets/floating_add_button.dart';
import 'package:todo_app_rp/widgets/title_widgets.dart';

class SchedulePage extends StatelessWidget {
  final int day;
  final List<ToDoItem> todoItems;

  const SchedulePage({
    Key? key,
    required this.day,
    required this.todoItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _CustomAppBar(),
          const SizedBox(height: 25),
          _CustomHeader(upcoming: todoItems.length, day: day),
          Expanded(
            child: _TimeLine(todoItems: todoItems),
          )
        ],
      ),
      floatingActionButton: FloatingAddButtonPage(),
    );
  }
}

class _CustomHeader extends StatelessWidget {
  const _CustomHeader({
    Key? key,
    required this.upcoming,
    required this.day,
  }) : super(key: key);

  final int upcoming;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TitleWidget(title: 'Upcoming task'),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              upcoming.toString(),
              style: kWhiteStyle,
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: DayItem(day: day, selectedItem: true),
        ),
      ],
    );
  }
}

class _TimeLine extends StatelessWidget {
  final List<ToDoItem> todoItems;

  const _TimeLine({
    Key? key,
    required this.todoItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => _TodoItemWidget(
          toDoItem: todoItems[index],
        ),
        itemCount: todoItems.length,
      ),
    );
  }
}

class _TodoItemWidget extends StatelessWidget {
  final ToDoItem toDoItem;

  const _TodoItemWidget({
    Key? key,
    required this.toDoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 28),
          child: Text(
            toDoItem.time,
            style: kGreyStyle.copyWith(fontSize: 14),
          ),
        ),
        Expanded(
          child: Container(
            constraints: BoxConstraints(minWidth: size.height * 0.10),
            height: size.height * 0.15,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: toDoItem.color,
                width: 2,
              ),
              borderRadius: kBorderRadius,
              color: toDoItem.color.withOpacity(0.05),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: toDoItem.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            toDoItem.detailTime,
                            style: kGreyStyle.copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 200,
                        child: Text(
                          toDoItem.name,
                          overflow: TextOverflow.ellipsis,
                          style: kStyleName,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 220,
                        child: Text(
                          toDoItem.details,
                          overflow: TextOverflow.ellipsis,
                          style: kGreyStyle.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Icon(
                      Icons.alarm,
                      size: 25,
                      color: toDoItem.remainder ? toDoItem.color : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Schedule ',
                  style: kStyleName.copyWith(fontSize: 26),
                ),
                const SizedBox(height: 5),
                Text(
                  // ignore: avoid_escaping_inner_quotes
                  'TODAY LIST',
                  style: kGreyStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Icon(
              Icons.date_range,
              color: Colors.black87,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
