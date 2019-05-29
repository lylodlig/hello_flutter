import 'package:flutter/material.dart';
import 'package:hello_flutter/test/Test.dart';

//事件监听,手势
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(),
          body: new Container(
            child: new Column(
              children: <Widget>[TestWidget(), TestWidget1(), TestWidget2()],
            ),
          )),
    );
  }
}

//点击事件
class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("点击"),
      onPressed: () => //页面跳转
          Navigator.push(context, MaterialPageRoute(builder: (_) => Test())),
    );
  }
}

//任意控件的手势事件
class TestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text("任意控件点击"),
      ),
      onTap: () => debugPrint("TestWidget1 Clicked"),
    );
  }
}

//原始手势事件监听
class TestWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.red,
      child: Listener(
        child: Text("Listenre"),
        onPointerDown: (event) => debugPrint("onPointerDown"),
        onPointerUp: (event) => debugPrint("onPointerUp"),
      ),
    );
  }
}
