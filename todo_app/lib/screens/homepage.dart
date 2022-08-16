import 'package:flutter/material.dart';
import 'package:todo_app/taskcard.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            vertical: 32.0,
          ),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Center(
                    child: Image(
                      image: AssetImage(
                        'assets/icon_images/homework.png',
                      ),
                      height: 80,
                      //fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TaskCard(),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
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
            ],
          ),
        ),
      ),
    );
  }
}