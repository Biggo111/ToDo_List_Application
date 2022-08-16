import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  //final String title;
  //TaskCard({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
    );
  }
}