import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/list/page_list.dart';

class TabHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabHomeState();
  }
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("List"),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ListMainPage())))
        ],
      ),
    );
  }
}
