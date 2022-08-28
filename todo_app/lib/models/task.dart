// class Task {
//   final int id;
//   final String title;
//   final String description;
//   Task({required this.id, required this.title, required this.description});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'description': description,
//     };
//   } 
// }
import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));
String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({
    this.id,
    this.title,
    this.description,
  });
  int? id;
  String? title;
  String? description;

  factory Todo.fromJson(Map<String,dynamic>json)=> Todo(
    id: json["id"],
    title: json["title"],
    description: json["description"],
  );
  Map<String, dynamic> toJson()=> {
    "id": id,
    "title": title,
    "description": description,
  }; 
}