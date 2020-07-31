import 'package:flutter/material.dart';
import 'package:todo_app_rp/mylist/my_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Scaffold(
        body: MyListPage(),
      ),
    );
  }
}
