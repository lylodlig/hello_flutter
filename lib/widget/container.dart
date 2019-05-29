import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: ContainerWidget(),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //位置
      alignment: Alignment.bottomLeft,
      //背景
//      color: Colors.amber,
      decoration: new BoxDecoration(
          //边框颜色，宽度
          border: Border.all(color: Colors.blue, width: 5),
          //背景图片
          image: const DecorationImage(
            image: const NetworkImage(
              'https://gw.alicdn.com/tfs/TB1CgtkJeuSBuNjy1XcXXcYjFXa-906-520.png',
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(10),
      child: new Column(
        children: <Widget>[
          new Text("十大科技"),
          new Container(
            color: Colors.red,
            //对大小的描述
            constraints: BoxConstraints(minHeight: 100),
            child: Center(
              child: Text("ajdf"),
            ),
          )
        ],
      ),
    );
  }
}

class DecorationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(50),
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.red, width: 5),
        //水平方向，椭圆
//        borderRadius: BorderRadius.horizontal(left: Radius.elliptical(20, 50))
//        borderRadius: BorderRadius.vertical(top: Radius.circular(50))
        borderRadius: BorderRadius.all(Radius.circular(20)),
        //阴影效果
        boxShadow: [
          BoxShadow(
              color: Color(0x99FFFF00),
              //觉得阴影的位置
              offset: Offset(1.0, 1.0),
              //模糊程度（越大越透明扩撒）
              blurRadius: 10.0,
              //模糊大小
              spreadRadius: 2.0),
          BoxShadow(color: Color(0x9900FF00), offset: Offset(1.0, 1.0)),
          BoxShadow(color: Color(0xFF0000FF))
        ],
        //形状，不能和borderRadius同时使用
//        shape: BoxShape.circle
      ),
      child: new Container(
        margin: const EdgeInsets.all(20),
        decoration: new ShapeDecoration(
          color: Colors.amber,
//            shape: Border.all(color: Color(0xFF00FFFF),style: BorderStyle.solid,width: 2)
            //圆形
//            shape: CircleBorder(side: BorderSide(color: Color(0xFFFFFF00), style: BorderStyle.solid, width: 2))
            //底部线
            shape: UnderlineInputBorder( borderSide:BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2))
            //矩形
//            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2))
            //八角边
//            shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)), side: BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2))
            //体育场
//            shape: StadiumBorder(side: BorderSide(width: 2, style: BorderStyle.solid, color: Color(0xFF00FFFF))
      ),
      ),
    );
  }
}
