import 'package:flutter/material.dart';
import 'dart:math' as math;

// 测试AspectRatio
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(),
          body: Container(
            height: 200.0,
            child: new AspectRatio(
              // 高是200，显示结果是宽就是100
              aspectRatio: 1/2,
              child: new Container(
                color: Colors.red,
              ),
            ),
          )),
    );
  }
}
