import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //color: Colors.red,
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
              TextField(
                decoration: InputDecoration(
                  hintText: '->Enter the task description here...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 50.0,
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