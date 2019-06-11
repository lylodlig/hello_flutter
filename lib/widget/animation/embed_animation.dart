import 'package:flutter/material.dart';

// 内嵌动画
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(),
          body: new Container(
            child: new Column(
              children: <Widget>[AnimWidget(), AnimWidget2()],
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
  var controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    // 线性输出
    controller = AnimationController(
        duration: Duration(milliseconds: 5000),
        // 提供 vsync 最简单的方式，就是直接继承 SingleTickerProviderStateMixin
        vsync: this
    );

    /// 非线性
    /// 更多的效果，参考 https://docs.flutter.io/flutter/animation/Curves-class.html
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    // 开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
//      scale: controller,
      scale: curvedAnimation,
      child: FlutterLogo(size: 200),
    );
  }
}

// 组合动画
class AnimWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimWidgetState2();
  }
}

class _AnimWidgetState2 extends State<AnimWidget2>
    with SingleTickerProviderStateMixin {
  var controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    // 线性输出
    controller = AnimationController(
        duration: Duration(milliseconds: 5000),
        // 提供 vsync 最简单的方式，就是直接继承 SingleTickerProviderStateMixin
        vsync: this
    );

    /// 非线性
    /// 更多的效果，参考 https://docs.flutter.io/flutter/animation/Curves-class.html
    /// 更多的动画控件，读者可以参考 https://flutter.dev/docs/development/ui/widgets/animation
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    // 开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var scaled = ScaleTransition(
      child: FlutterLogo(size: 200),
      scale: curvedAnimation,
    );
    return FadeTransition(
      child: scaled,
      opacity: curvedAnimation,
    );
  }
}