import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/example/message/Main.dart';

//输入返回列表，增加记录
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(),
            body: MainWidget()));
  }
}

