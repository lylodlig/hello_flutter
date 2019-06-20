import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/state/provider/User.dart';
import 'package:hello_flutter/pages/state/provider/client.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final client = Provider.of<Client>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
                '从Provider获取数据：${Provider.of<String>(context)}\nUser:${user.name}\nClinet:${client.name}'),
            RaisedButton(
              onPressed: () {
                // 这样修改后不会刷新界面
                user.setName("修改后的名字");
              },
              child: Text("修改User Provider数据"),
            ),
            RaisedButton(
              onPressed: () {
                client.setName("修改后的Client名字");
              },
              child: Text("修改Client Provider数据"),
            )
          ],
        ),
      ),
    );
  }
}
