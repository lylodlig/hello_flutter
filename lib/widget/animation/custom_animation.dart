import 'package:flutter/material.dart';

// 自定义动画
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(),
          body: new Container(
            child: new Column(
              children: <Widget>[AnimWidget()],
            ),
          )),
    );
  }
}

class AnimWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimWidgetState();
  }
}

class _AnimWidgetState extends State<AnimWidget>
    with SingleTickerProviderStateMixin {
  static final padding = 16.0;

  AnimationController controller;
  Animation<double> left;
  Animation<Color> color;

  @override
  void initState() {
    super.initState();

    /// 只有在 initState 执行完，我们才能通过 MediaQuery.of(context) 获取    
    ///  mediaQueryData。这里通过创建一个 Future 从而在 Dart 事件队列里插入    
    ///  一个事件，以达到延后执行的目的（类似于在 Android 里 post 一个 Runnable）    
    ///  关于 Dart 的事件队列，读者可以参考 https://webdev.dartlang.org/articles/performance/event-loop
    Future(_initState);
  }

  void _initState() {
    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    final mediaData = MediaQuery.of(context);
    final displayWidth = mediaData.size.width;
    debugPrint('width$displayWidth');

    color = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);


    left = Tween(begin: padding, end: displayWidth - padding)
        .animate(controller)
      ..addListener(() {
        /// 调用 setState 触发他重新 build 一个 Widget。在 build 方法里，我们根据
        /// Animatable<T> 的当前值来创建 Widget，达到动画的效果（类似 Android 的属性动画）。
        setState(() {
          // have nothing to do
        });
      })
    // 监听动画状态
      ..addStatusListener((status) {
        // 动画完成
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final color = this.color == null ? Colors.red : this.color.value;
    var marginLeft = left == null ? padding : left.value;
//    var marginTop = math.sin(marginLeft);
//    debugPrint('margin=$marginLeft;$marginTop');
    return Container(
      margin: EdgeInsets.only(left: marginLeft, top: marginLeft),
      child: Container(
        decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(5),
        ),
        width: 15.0,
        height: 15.0,
      ),
    );
  }
}
