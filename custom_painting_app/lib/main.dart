import 'dart:ui';

import 'package:custom_painting_app/my_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'consts.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          _BackgroundWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _PaintArea(),
                SizedBox(height: 20),
                _ActionBarWidget(
                  clearCanvas: () {},
                  changeSliderValue: (value) {
                    print('change value');
                  },
                  changeColorValue: (color) {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PaintArea extends StatefulWidget {
  @override
  _PaintAreState createState() => _PaintAreState();
}

class _PaintAreState extends State<_PaintArea> {
  List<DrawingArea> points = [];
  Color selectedColor = Colors.black;
  double stroke = 2.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.7,
      decoration: kDecoration,
      child: GestureDetector(
        onPanDown: (details) {
          addPoint(details.localPosition);
        },
        onPanUpdate: (details) {
          addPoint(details.localPosition);
        },
        onPanEnd: (details) {
          addPoint(null);
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
    );
  }

  void addPoint(Offset point) {
    points.add(DrawingArea(
      point: point,
      areaPaint: getCurrentPaint(),
    ));

    setState(() {});
  }

  Paint getCurrentPaint() => Paint()
    ..color = selectedColor
    ..strokeWidth = stroke
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round;
}

class _ActionBarWidget extends StatefulWidget {
  final VoidCallback clearCanvas;
  final Function(double) changeSliderValue;
  final Function(Color) changeColorValue;

  const _ActionBarWidget({
    Key key,
    @required this.clearCanvas,
    @required this.changeSliderValue,
    @required this.changeColorValue,
  }) : super(key: key);

  @override
  _ActionBarWidgetState createState() => _ActionBarWidgetState();
}

class _ActionBarWidgetState extends State<_ActionBarWidget> {
  final selectedColor = ValueNotifier<Color>(Colors.black);
  final stroke = ValueNotifier<double>(2.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
      valueListenable: selectedColor,
      builder: (context, newColor, child) => Container(
        width: size.width * 0.8,
        decoration: kDecoration.copyWith(color: Colors.white),
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.color_lens,
                  color: newColor,
                ),
                onPressed: myShowDialog),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: stroke,
                builder: (context, newStroke, child) => Slider(
                  min: 1.0,
                  max: 7.0,
                  value: newStroke,
                  activeColor: newColor,
                  onChanged: (value) {
                    stroke.value = value;
                    widget.changeSliderValue.call(value);
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.layers_clear),
              onPressed: widget.clearCanvas,
            ),
          ],
        ),
      ),
    );
  }

  void myShowDialog() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor.value,
            onColorChanged: (Color color) {
              selectedColor.value = color;
              widget.changeColorValue(color);
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

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
