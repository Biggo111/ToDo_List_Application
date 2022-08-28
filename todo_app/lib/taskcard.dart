import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  //final String title;
  //TaskCard({this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text('Remove task?'),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                  Text(
                    'Delete',
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(
                      Icons.cancel,
                    ),
                  ),
                  Text(
                    'Cancel',
                  ),
                ],
              ),
            ],
            ),
          );
      },
      child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 50.0,
            ),
            margin: EdgeInsets.only(
              bottom: 10.0,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 233, 221, 221),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Started!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Text(
                    "Hey! I'm your todo list and ready here to help you...",
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
