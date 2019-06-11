import 'package:flutter/material.dart';
import 'dart:math' as math;

// 自定义动画
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(),
          body: Container(
            child: CustomPaint(painter: DemoPaint(0.0, math.pi)),
            height: 200.0,
            width: 200.0,
            color: Colors.deepOrange,
            padding: EdgeInsets.all(30.0),
          )),
    );
  }
}

class DemoPaint extends CustomPainter {
  final double _arcStart;
  final double _arcSweep;

  DemoPaint(this._arcStart, this._arcSweep);

  @override
  void paint(Canvas canvas, Size size) {
    double _side = math.min(size.width, size.height);
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
        Offset.zero & Size(_side, _side), _arcStart, _arcSweep, false, paint);
  }

  @override
  bool shouldRepaint(DemoPaint oldDelegate) {
    return _arcStart != oldDelegate._arcStart ||
        _arcSweep != oldDelegate._arcSweep;
  }

}
