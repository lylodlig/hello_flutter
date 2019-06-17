import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerPageState();
  }
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("2536754@qq.com"),
          accountName: Text("李枝宇"),
          currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg')),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.amber,
          ),
        ),
        ListTile(
          title: Text("测试1"),
          subtitle: Text("sub"),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ]),
    );
  }
}
