import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final kDecoration = BoxDecoration(
      color: Colors.white,
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

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(138, 35, 135, 1.0),
                  Color.fromRGBO(233, 64, 87, 1.0),
                  Color.fromRGBO(242, 113, 33, 1.0),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.8,
                  height: height * 0.7,
                  decoration: kDecoration,
                  child: GestureDetector(
                    onPanDown: (details) {},
                    onPanUpdate: (details) {},
                    onPanEnd: (details) {},
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: width * 0.8,
                  decoration: kDecoration,
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.color_lens), onPressed: () {}),
                      IconButton(icon: Icon(Icons.color_lens), onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawingArea {
  Offset point;
  Paint areaPaint;
}
