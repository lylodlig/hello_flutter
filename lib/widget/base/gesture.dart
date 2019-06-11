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
        onPressed: () async {
          //页面跳转
//        Navigator.push(context, MaterialPageRoute(builder: (_) => Test()))
          var msg = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => Test()));
          debugPrint(msg);
        });
  }
}

//任意控件的手势事件
///onTapDown：按下
/// onTap：点击动作
/// onTapUp：抬起
/// onTapCancel：前面触发了 onTapDown，但并没有完成一个 onTap 动作
/// onDoubleTap：双击
/// onLongPress：长按
/// onScaleStart, onScaleUpdate, onScaleEnd：缩放
/// onVerticalDragDown, onVerticalDragStart, onVerticalDragUpdate, onVerticalDragEnd, onVerticalDragCancel, onVerticalDragUpdate：在竖直方向上移动
/// onHorizontalDragDown, onHorizontalDragStart, onHorizontalDragUpdate, onHorizontalDragEnd, onHorizontalDragCancel, onHorizontalDragUpdate：在水平方向上移动
/// onPanDown, onPanStart, onPanUpdate, onPanEnd, onPanCancel：拖曳（水平、竖直方向上移动）
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
        onPointerMove: (event) => print('onPointerMove'),
        onPointerCancel: (event) => print('onPointerCancel'),
      ),
    );
  }
}
