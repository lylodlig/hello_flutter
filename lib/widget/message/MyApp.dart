import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/message/MessageList.dart';

//事件监听,手势
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(appBar: new AppBar(), body: MessageList()));
  }
}
