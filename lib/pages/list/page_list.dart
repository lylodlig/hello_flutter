import 'package:flutter/material.dart';

class ListMainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ListMainPageState();
  }
}

class _ListMainPageState extends State<ListMainPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          RaisedButton(child: Text("最简单的ListView"),)
        ],
      ),
    );
  }

}