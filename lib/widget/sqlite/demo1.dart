import 'package:sqflite/sqflite.dart';
//void main(){
//    Todo().foo();
//}
class Todo {
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnContent = 'content';

  int id;
  String title;
  String content;

  Todo(this.title, this.content, [this.id]);

  Todo.fromMap(Map<String, dynamic> map)
      : id = map[columnId],
        title = map[columnTitle],
        content = map[columnContent];

  Map<String, dynamic> toMap() => {
    columnTitle: title,
    columnContent: content,
  };


  @override
  String toString() {
    return 'Todo{id: $id, title: $title, content: $content}';
  }

  void foo() async {
    const table = 'Todo';
    var path = await getDatabasesPath() + '/demo.deb';
    var database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      var sql = '''
          CREATE TAB $table (
            ${Todo.columnId} INTEGER PRIMARY KEY,
            ${Todo.columnTitle} TEXT,
            ${Todo.columnContent} TEXT
          )
            ''';
      await db.execute(sql);
    });

    await database.delete(table);

    var todo1 = Todo("Title1", "Content1", 1);
    var todo2 = Todo("Title2", "Content2", 2);

    var map=todo1.toMap();

    await database.insert(table, todo1.toMap());
    await database.insert(table, todo2.toMap());
  }
}
