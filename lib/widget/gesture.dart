import 'package:flutter/material.dart';
//事件监听,手势
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(),
        body: TestWidget(),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("点击"),
      onPressed: () => debugPrint("Clicked"),
    );
  }
}
