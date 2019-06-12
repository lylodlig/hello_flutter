import 'package:sqflite/sqflite.dart';

class Todo {
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnContent = 'content';

  int id;
  String title;
  String content;

  Todo(this.id, this.title, this.content);

  Todo.fromMap(Map<String, dynamic> map)
      : id = map[columnId], title = map[columnTitle], content = map[columnContent];

}
