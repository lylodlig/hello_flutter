import 'package:flutter/material.dart';

/// gridView示例界面1
class GridDemo1Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _GridDemo1PageState();
}

class _GridDemo1PageState extends State<GridDemo1Page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Grid Page 1 demo'),
      ),
      body: new Center(
        child: buildGrid2(),
      ),
    );
  }

  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
        (int index) => new Container(
              color: Colors.amber,
              child: new Text("data ${index + 1}"),
            ));
  }

  Widget buildGrid() {
    return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(30),
    );
  }

  Widget buildGrid2() {
    var countGrid = GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
      childAspectRatio: 1.3,
      children: _buildGridTileList(30),
    );
    return countGrid;
  }
}
