import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/db_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskPage extends StatefulWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _desCriptionController;
  //String text="";
  int? _id;
 @override
  void initState() {
    _titleController = TextEditingController();
    _desCriptionController = TextEditingController();
  }
  Random _random = Random();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //color: Colors.red,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24.0,
                    bottom: 6.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image(
                            image: AssetImage('assets/icon_images/arrow.png'),
                            height: 20.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          // onSubmitted: (value) async {
                          //   if(value!=''){
                          //     DatabaseHelper _dbHelper = DatabaseHelper();

                          //     Task _newTask = Task(
                          //       title: value,
                          //     );
                          //     await _dbHelper.insertTask(_newTask);
                          //   }
                          // },
                          decoration: InputDecoration(
                            hintText: 'Enter the task',
                          ),
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  child: TextField(
                    controller: _desCriptionController,
                     keyboardType: TextInputType.multiline,
                     maxLines: null,
                     decoration: InputDecoration(
                        hintText: '->Enter the task description here...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                              horizontal: 50.0,
                              vertical: 50.0,
                         ),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.green,
                    onPressed: () async{
                      setState(() {
                            isLoading = true;
                          });
                         final todo = Todo(
                           id: _random.nextInt(100),
                           title: _titleController.text,
                           description: _desCriptionController.text
                         );
                         await DataBaseHelper.instance.addTodos(todo);
                         setState(() {
                           isLoading = false;
                         });
                    },
                    label: Text('Save Task'),
                    icon: Icon(
                      Icons.save,
                      size: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); 
  }
}