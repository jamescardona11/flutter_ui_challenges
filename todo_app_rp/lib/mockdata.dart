import 'package:flutter/material.dart';
import 'package:todo_app_rp/model/item_list.dart';
import 'package:todo_app_rp/model/todo_item.dart';

class MockData {
  static const List<ItemList> itemList = [
    ItemList(name: 'All Tasks', numberOfTask: 20, completeTask: 5, icon: Icons.star_border, color: Colors.blueGrey),
    ItemList(name: 'Personal', numberOfTask: 10, completeTask: 3, icon: Icons.person_outline, color: Colors.deepPurple),
    ItemList(name: 'Work', numberOfTask: 15, completeTask: 15, icon: Icons.mail_outline, color: Colors.teal),
    ItemList(
        name: 'Ideas', numberOfTask: 10, completeTask: 8, icon: Icons.lightbulb_outline, color: Colors.orangeAccent),
    ItemList(name: 'Urgency', numberOfTask: 1, completeTask: 0, icon: Icons.priority_high, color: Colors.blue),
    ItemList(name: 'Art', numberOfTask: 4, completeTask: 3, icon: Icons.color_lens, color: Colors.green),
    ItemList(name: 'Next Week', numberOfTask: 12, completeTask: 0, icon: Icons.next_week, color: Colors.brown),
  ];

  static const List<ToDoItem> todoList = [
    ToDoItem(
        name: 'Break',
        details: 'Break to lunch - Go to JC Burger',
        remainder: true,
        time: '12 PM',
        detailTime: '12 PM - 1:30 PM',
        color: Colors.teal),
    ToDoItem(
        name: 'Create design proposal',
        details: 'Continue with design for challenge',
        remainder: false,
        time: '2 PM',
        detailTime: '2 PM - 4:30 PM',
        color: Colors.teal),
    ToDoItem(
        name: 'Meeting with team',
        details: 'Meeting to create release to production for client',
        remainder: true,
        time: '5 PM',
        detailTime: '5 PM - 6 PM',
        color: Colors.teal),
    ToDoItem(
        name: 'Art exhibition in the museum',
        details: 'Friends meetup',
        remainder: false,
        time: '6 PM',
        detailTime: '6 PM - 8 PM',
        color: Colors.deepPurple),
    ToDoItem(
        name: 'Walk with dog',
        details: 'Go with halley to the park',
        remainder: true,
        time: '9 PM',
        detailTime: '9 PM - 10 PM',
        color: Colors.green),
  ];
}
