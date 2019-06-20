import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/state/provider/provider1.dart';
import 'package:hello_flutter/pages/state/stream/counter.dart';

class StatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("使用Stream完成Counter"),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CounterPage()))),
            RaisedButton(
                child: Text("获取Provider的数据"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProviderPage()))),
          ],
        ),
      ),
    );
  }
}
