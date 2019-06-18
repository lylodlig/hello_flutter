import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/list/page_simple_list.dart';
import 'package:hello_flutter/pages/list/page_simple_list2.dart';
import 'package:hello_flutter/pages/list/page_simple_load_list.dart';

class ListMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListMainPageState();
  }
}

class _ListMainPageState extends State<ListMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("最简单的ListView"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PageSimpleList()))),
            RaisedButton(
                child: Text("最简单的ListView,通过itemBuild"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PageSimpleList2()))),
            RaisedButton(
                child: Text("异步获取数据的ListView"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PageSimpleLoadList())))
          ],
        ),
      ),
    );
  }
}
