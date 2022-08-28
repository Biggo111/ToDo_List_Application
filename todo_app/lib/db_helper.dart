// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// import 'models/task.dart';

// class DatabaseHelper {
//   Future<Database> database() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'todo.db'),
//       onCreate: (db, version) {
//         // Run the CREATE TABLE statement on the database.
//         return db.execute(
//           'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }
// }

// Future<void> insertTask(Task task) async {

//   Database _db = await database();
//   await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
// }

// Future<List<Task>> getTasks() async {
//   Database _db = await Database();
//   List<Map<String,dynamic>> taskMap = await _db.query('tasks');
//   return List.generate(taskMap.length, (index){
//     return Task(id: taskMap[index]['id'], title: taskMap[index]['title'], description: taskMap[index]['description']);
//   });
// }
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/models/task.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationSupportDirectory();
    String path = join(documentDirectory.path, 'todos.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version)async{
    await db.execute(
      """
     CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT)
      """
    );
  }
  Future<int> addTodos(Todo todo) async {
    Database db = await instance.database;
    return await db.insert('todos', todo.toJson()); 
  }

  Future<List<Todo>> getTodos()async{
    Database db = await instance.database;
    var todos = await db.query('todos', orderBy: "id");
    List<Todo> _todos = todos.isNotEmpty ? todos.map((todo) => Todo.fromJson(todo)).toList() : [];
    return _todos;
  }

}