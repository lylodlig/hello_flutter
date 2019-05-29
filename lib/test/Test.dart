import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RaisedButton(
        //返回携带参数
        onPressed: () => Navigator.pop(context,"msg"),
        child: Text("返回"),
      ),
    );
  }
}
