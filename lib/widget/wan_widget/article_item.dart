import 'package:flutter/material.dart';

class ArticleItem extends StatefulWidget {
  var data;
  ArticleItem(this.data,{Key key}) : super(key: key);

  @override
  _ArticleItemState createState() => _ArticleItemState(data);
}

class _ArticleItemState extends State<ArticleItem> {
  var data;

  _ArticleItemState(this.data);

  Widget buildAuthor() {
    return Row(
      children: <Widget>[
        Text('作者：'),
        Expanded(
          child: Text(
            data['author'],
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          flex: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final author = Row(
      children: <Widget>[
        Text('作者：'),
        Expanded(
          child: Text(
            data['author'],
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          flex: 1,
        ),
        Text(
          data['niceDate'],
          style: TextStyle(color: Theme.of(context).accentColor),
        )
      ],
    );

    final content = Text(data['title'],
        style: TextStyle(color: Colors.black, fontSize: 16));

    bool isCollect = data["collect"];
    final sub = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            data['chapterName'],
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          flex: 1,
        ),
        IconButton(
          icon: isCollect ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          onPressed: () => _handleOnItemClick(data),
        )
      ],
    );

    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5), child: author),
          Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5), child: content),
          Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5), child: sub),
        ],
      ),
    );
  }

  _handleOnItemClick(data) {}
}
