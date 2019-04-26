import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/RollingBtn.dart';

void main() {
  runApp(MyApp());
}

/// 这个 widget 作用这个应用的顶层 widget.
///
/// 这个 widget 是无状态的，所以我们继承的是 [StatelessWidget].
/// 对应的，有状态的 widget 可以继承 [StatefulWidget]
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My first Flutter APP',
      //应用主页
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: RollingButton(),
        ),
      ),
    );
  }
}
