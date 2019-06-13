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
      : id = map[columnId],
        title = map[columnTitle],
        content = map[columnContent];

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, content: $content}';
  }

  void foo() async {
    const table = 'Todo';
    var path = await getDatabasesPath() + '/demo.deb';
    var database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          var sql='''
          CREATE TAB $table (
            ${Todo.columnId} INTEGER PRIMARY KEY,
            ${Todo.columnTitle} TEXT,
            ${Todo.columnContent} TEXT
          )
            ''';
          await db.execute(sql);
        }
    );

    await database.delete(table);
  }



}
