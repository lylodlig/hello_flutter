import 'package:flutter/material.dart';

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
              children: <Widget>[TestWidget()],
            ),
          )),
    );
  }
}

//点击事件
class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestWidget();
  }
}

class _TestWidget extends State<TestWidget> {
  var editController = new TextEditingController();

  //对象销毁的时候调用
  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(15),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
            decoration: new InputDecoration(
              hintText: "请输入",
            ),
            style: new TextStyle(color: Colors.amber, fontSize: 22),
            controller: editController,
            autofocus: true,
          )),
          new InkWell(
            onTap: () => debugPrint("text:${editController.text}"),
            child: new Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12)),
              child: Text("Send"),
            ),
          )
        ],
      ),
    );
  }
}
