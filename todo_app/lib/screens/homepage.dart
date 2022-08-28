import 'package:flutter/material.dart';
import 'package:todo_app/db_helper.dart';
import 'package:todo_app/taskcard.dart';
import 'package:todo_app/screens/taskpage.dart';

import '../models/task.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo list',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 30.0,
                      ),
                      child: Image(
                        image: AssetImage(
                          'assets/icon_images/homework.png',
                        ),
                        height: 80,
                        //fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: DataBaseHelper.instance.getTodos(),
                      builder: (BuildContext context, AsyncSnapshot<List<Todo>>snapshot){
                        if(snapshot.hasError){
                          return Text('Error');
                        }
                        return snapshot.data!.isEmpty?Text('No data found'): ListView(
                          children: snapshot.data!.map((Todo todo){
                            return ListTile(
                              title: Text(todo.title!),
                              subtitle: Text(todo.description!),
                            );
                          }).toList(),
                        );
                      }
                    )
                  ),
                ],
              ),
              Positioned(
                bottom: 20.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaskPage()));
                  },
                  child: Container(
                    height: 50.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      //color: Color.fromARGB(255, 141, 220, 249),
                      //borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        'assets/icon_images/plus.png',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}