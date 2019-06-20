import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/state/provider/User.dart';
import 'package:hello_flutter/pages/state/provider/client.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/pages/page_main.dart';

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
    // 绑定Provider
//    return Provider<String>.value(
//        value: "provider data",
//        child: MaterialApp(
//          title: 'My first Flutter APP',
//          //应用主页
//          home: Main(),
//        ));
    // 绑定多个数据
    return MultiProvider(
        providers: [
          Provider<User>.value(value: User(20, "张三")),
          Provider<String>.value(value: "来自Provider的数据"),
          ChangeNotifierProvider(
            builder: (context) => Client("客户名字"),
          )
        ],
        child: MaterialApp(
          title: 'My first Flutter APP',
          //应用主页
          home: Main(),
        ));
  }
}
