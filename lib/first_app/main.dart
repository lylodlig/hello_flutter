import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hello_flutter/first_app/RandomWords.dart';
//import 'package:hello_flutter/widget/base.dart';
import 'package:hello_flutter/widget/base/container.dart';
import 'package:hello_flutter/widget/base/gridview.dart';
import 'package:hello_flutter/widget/base/listview.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text('Hello World'), // Replace the highlighted text...
          child: ListWidget3(), // With this highlighted text.
        ),
      ),
    );
  }
}
