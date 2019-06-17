import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/pages/drawer/drawer.dart';
import 'package:hello_flutter/pages/tab_home.dart';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text("待定"), centerTitle: true),
          drawer: DrawerPage(),
          body: IndexedStack(
            children: <Widget>[TabHome(), Text("2")],
            index: _index,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("首页")),
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("我的"))
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
        onWillPop: _pop);
  }

  Future<bool> _pop() {
    _showDialogExit();
    return Future.value(false);
  }

  void _showDialogExit() {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Text("退出？"),
          actions: <Widget>[
            FlatButton(
              child: Text("确定"),
              onPressed: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
            )
          ],
        ));
  }
}
