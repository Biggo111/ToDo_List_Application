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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image(
                      image: AssetImage('assets/icon_images/arrow.png'),
                      height: 20.0,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the task',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}