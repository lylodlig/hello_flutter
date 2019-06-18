import 'package:flutter/material.dart';

class PageSimpleList extends StatefulWidget {
  @override
  _PageSimpleListState createState() => _PageSimpleListState();
}

class _PageSimpleListState extends State<PageSimpleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("测试1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Divider(),
            ListTile(
              title: Text("测试1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Divider(),
            ListTile(
              title: Text("测试1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Divider(),
            ListTile(
              title: Text("测试1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Divider(),
            ListTile(
              title: Text("测试1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
