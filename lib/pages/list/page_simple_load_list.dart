import 'package:flutter/material.dart';

// 加载更多的ListView
class PageSimpleLoadList extends StatefulWidget {
  @override
  _PageSimpleLoadListState createState() => _PageSimpleLoadListState();
}

class _PageSimpleLoadListState extends State<PageSimpleLoadList> {
  final _scrollController = ScrollController();
  bool _isPerformingRequest = false;
  final List<int> items = List.generate(10, (i) => i);

  @override
  void initState() {
    _scrollController.addListener(() {
      // 滚动到底部
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getAsyncData();
      }
    });
    super.initState();
  }

  _getAsyncData() async {
    if (!_isPerformingRequest) {
      setState(() {
        _isPerformingRequest = true;
      });
      List<int> newList = await fakeRequest(items.length);
      setState(() {
        items.addAll(newList);
        _isPerformingRequest = false;
      });
    }
  }

  Future<List<int>> fakeRequest(int from) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(10, (index) => index + from);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: _isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('items:$items');
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(8.0),
        itemCount: items.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == items.length) {
            return _buildProgressIndicator();
          } else
            return ListTile(
              title: Text('Item ${items[index]}'),
            );
        },
      ),
    );
  }
}
