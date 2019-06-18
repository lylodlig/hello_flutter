import 'package:flutter/material.dart';

// 上拉加载更多的ListView
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
      // 处理空数据的情况
      if (newList.isEmpty) {
        double edge = 50.0;
        debugPrint(
            'maxScrollExtent:${_scrollController.position.maxScrollExtent}   pixels:${_scrollController.position.pixels}');
        // _scrollController.position.pixels当前滚动位置的像素值
        // _scrollController.position.maxScrollExtent滚动的最大范围
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        items.addAll(newList);
        _isPerformingRequest = false;
      });
    }
  }

  Future<List<int>> fakeRequest(int from) async {
    return Future.delayed(Duration(seconds: 2), () {
      if (from >= 30) return [];
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
