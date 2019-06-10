import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text("1"),
              Text("1"),
              Text("1"),
            ],
          ),
        ));
  }
}
