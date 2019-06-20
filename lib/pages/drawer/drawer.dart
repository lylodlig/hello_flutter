import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/list/page_list.dart';
import 'package:hello_flutter/pages/state/state.dart';

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
          title: Text("List"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ListMainPage()));
          },
        ),
        ListTile(
          title: Text("状态管理"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => StatePage()));
          },
        )
      ]),
    );
  }
}
