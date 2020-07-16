import 'dart:ui';
import 'package:custom_painting_app/consts.dart';
import 'package:custom_painting_app/my_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color selectedColor = Colors.black;
  double stroke = 2.0;
  bool clearArea = false;

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
                _PaintArea(
                  selectedColor: selectedColor,
                  stroke: stroke,
                  clearArea: clearArea,
                ),
                SizedBox(height: 20),
                _ActionBarWidget(
                  clearCanvas: (clear) {
                    clearArea = clear;

                    setState(() {});
                  },
                  changeSliderValue: (value) {
                    stroke = value;
                    setState(() {});
                  },
                  changeColorValue: (color) {
                    selectedColor = color;
                    setState(() {});
                  },
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
  final Color selectedColor;
  final double stroke;
  final bool clearArea;

  const _PaintArea({
    Key key,
    @required this.selectedColor,
    @required this.stroke,
    @required this.clearArea,
  }) : super(key: key);

  @override
  _PaintAreState createState() => _PaintAreState();
}

class _PaintAreState extends State<_PaintArea> {
  final points = ValueNotifier<List<DrawingArea>>([]);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.clearArea) {
      points.value = [];
    }

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
          child: ValueListenableBuilder(
            valueListenable: points,
            builder: (context, value, child) => CustomPaint(
              painter: MyCustomPainter(
                points: value,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addPoint(Offset point) {
    points.value = List<DrawingArea>.from(points.value)
      ..add(DrawingArea(
        point: point,
        areaPaint: getCurrentPaint(),
      ));

    setState(() {});
  }

  Paint getCurrentPaint() => Paint()
    ..color = widget.selectedColor
    ..strokeWidth = widget.stroke
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round;
}

class _ActionBarWidget extends StatefulWidget {
  final Function(bool) clearCanvas;
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
  final clear = ValueNotifier<bool>(false);

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
              onPressed: () {
                widget.clearCanvas(true);
                Future.delayed(Duration(milliseconds: 500)).then(
                  (value) => widget.clearCanvas(false),
                );
              },
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
