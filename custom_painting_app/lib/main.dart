import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  List<DrawingArea> points = [];
  Color selectedColor = Colors.black;
  double stroke = 2.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
                    onPanDown: (details) {
                      setState(() {
                        points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: getCurrentPaint(),
                        ));
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: getCurrentPaint(),
                        ));
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        points.add(null);
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: CustomPaint(
                        painter: MyCustomPainter(
                          points: points,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: width * 0.8,
                  decoration: kDecoration.copyWith(color: Colors.white),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.color_lens,
                            color: selectedColor,
                          ),
                          onPressed: myShowDialog),
                      Expanded(
                        child: Slider(
                          min: 1.0,
                          max: 7.0,
                          value: stroke,
                          activeColor: selectedColor,
                          onChanged: (value) {
                            setState(() {
                              stroke = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.layers_clear),
                          onPressed: () {
                            setState(() {
                              points = [];
                            });
                          }),
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

  Paint getCurrentPaint() => Paint()
    ..color = selectedColor
    ..strokeWidth = stroke
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round;

  void myShowDialog() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (Color color) {
              setState(() => selectedColor = color);
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final List<DrawingArea> points;

  MyCustomPainter({
    this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(rect, backgroundPaint);

    for (int x = 0; x < points.length - 1; ++x) {
      if (points[x] != null && points[x + 1] != null) {
        canvas.drawLine(points[x].point, points[x + 1].point, points[x].areaPaint);
      } else if (points[x] != null && points[x + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[x].point], points[x].areaPaint);
      }
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => true;
}

class DrawingArea {
  final Offset point;
  final Paint areaPaint;

  DrawingArea({
    this.point,
    this.areaPaint,
  });
}
