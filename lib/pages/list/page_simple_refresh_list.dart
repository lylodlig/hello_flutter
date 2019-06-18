import 'package:flutter/material.dart';

// 上拉加载更多的ListView
class PageRefreshList extends StatefulWidget {
  @override
  _PageRefreshListState createState() => _PageRefreshListState();
}

/// ProgressIndicator是进度控件，LinearProgressIndicator和CircleProgressIndicator是它的实现类
///
class _PageRefreshListState extends State<PageRefreshList> {
  final List<int> items = List.generate(10, (i) => i);

//  final mLPI = LinearProgressIndicator(
//    backgroundColor: Colors.blue,
//    valueColor: AlwaysStoppedAnimation(Colors.red),
//    value: 0.5,
//  );
//  final mCPI = CircularProgressIndicator(
//    backgroundColor: Colors.blue,
//    valueColor: AlwaysStoppedAnimation(Colors.red),
//    value: 0.8,
//  );

  Future _getAsyncData() async {
    List<int> newList = await fakeRequest(items.length);
    items.clear();
    setState(() {
      items.addAll(newList);
    });
    return null;
  }

  Future<List<int>> fakeRequest(int from) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(10, (index) => index + from);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item ${items[index]}'),
              );
            },
          ),
          onRefresh: _getAsyncData),
    );
  }
}
