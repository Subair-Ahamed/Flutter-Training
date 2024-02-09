import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.menu), //menu bar - drawer
            onPressed: () {
              print("Icon pressed");
            },
          ),
          title: Text("My AppBar"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search), //search icon
                onPressed: () {
                  print("Searched");
                }),
            IconButton(
                icon: Icon(Icons.more_vert), //options icon
                onPressed: () {
                  print("Options");
                })
          ],
          flexibleSpace: SafeArea(
              child: Icon(
            Icons.camera,
            color: Colors.white,
            size: 25,
          )),
          bottom: PreferredSize(
            child: Container(
              color: Colors.purple,
              height: 75.0,
              width: double.infinity,
              child: Text(
                "AppBar Widgets",
                style: TextStyle(color: Colors.yellow, fontSize: 20),
              ),
            ),
            preferredSize: Size.fromHeight(75.0),
          ),
        ));
  }
}
