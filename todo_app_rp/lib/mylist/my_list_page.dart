import 'package:flutter/material.dart';
import 'package:todo_app_rp/animation/scale_transition.dart';
import 'package:todo_app_rp/consts.dart';
import 'package:todo_app_rp/mockdata.dart';
import 'package:todo_app_rp/model/item_list.dart';
import 'package:todo_app_rp/schedule/schedule_page.dart';
import 'package:todo_app_rp/utils.dart';
import 'package:todo_app_rp/widgets/circular_percent_progress.dart';
import 'package:todo_app_rp/widgets/day_item.dart';
import 'package:todo_app_rp/widgets/floating_add_button.dart';
import 'package:todo_app_rp/widgets/title_widgets.dart';

class MyListPage extends StatelessWidget {
  final username = '@jamescardona11';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(
          children: [
            _CustomAppBar(username: username),
            const TitleWidget(title: 'My List'),
            _DatePicker(),
            Expanded(child: _BottomContainer()),
          ],
        ),
      ),
      floatingActionButton: FloatingAddButtonPage(),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key key,
    @required this.username,
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey, $username',
                  style: kStyleName.copyWith(fontSize: 26),
                ),
                const SizedBox(height: 5),
                Text(
                  // ignore: avoid_escaping_inner_quotes
                  'Let\'s make this day productive',
                  style: kGreyStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Expanded(
              child: Image(
                image: AssetImage('assets/images/imageprofile.jpg'),
                width: 70,
                height: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DatePicker extends StatefulWidget {
  @override
  __DatePickerState createState() => __DatePickerState();
}

class __DatePickerState extends State<_DatePicker> {
  final selectedItem = ValueNotifier<int>(3);

  @override
  Widget build(BuildContext context) {
    final days = daysInMonth();
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days,
        itemBuilder: (_, day) {
          return ValueListenableBuilder(
            valueListenable: selectedItem,
            builder: (_, value, __) => GestureDetector(
              onTap: () => onPressItem(day),
              child: DayItem(day: day, selectedItem: day == selectedItem.value),
            ),
          );
        },
      ),
    );
  }

  void onPressItem(int day) {
    selectedItem.value = day;
    Navigator.push(
      context,
      ScaleRoute(page: SchedulePage(day: day, todoItems: MockData.todoList)),
    );
  }
}

class _BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: GridView.count(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        childAspectRatio: 0.8,
        crossAxisCount: 2,
        children: MockData.itemList
            .map(
              (item) => _MyListItem(itemList: item),
            )
            .toList(),
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final ItemList itemList;

  const _MyListItem({
    Key key,
    @required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius,
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 7, spreadRadius: -3),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercent(
                size: 35,
                percent: itemList.percent,
                primaryColor: itemList.color,
              ),
              Icon(
                itemList.icon,
                color: itemList.color,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                itemList.name,
                style: kStyleName,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: Text(
              itemList.itemsTxt,
              style: kGreyStyle.copyWith(fontSize: 14),
            ),
          ),
          const Expanded(child: SizedBox()),
          Wrap(
            runSpacing: 5,
            children: [
              _ChipTask(text: '${itemList.completeTask} completed', color: itemList.color),
              _ChipTask(text: '${itemList.leftTask} left', color: Colors.pinkAccent),
            ],
          )
        ],
      ),
    );
  }
}

class _ChipTask extends StatelessWidget {
  const _ChipTask({
    Key key,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: kBorderRadius,
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
}
