import 'package:flutter/material.dart';
import 'package:todo_app/screens/homepage.dart';
import 'package:todo_app/screens/taskpage.dart';
void main() {
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo application',
      home: HomePage(),
    );
  }
}