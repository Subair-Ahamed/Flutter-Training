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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.menu), //menu bar - drawer
          onPressed: () {
            print("Icon pressed");
          },
        ),
        title: Text(
          "My AppBar",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), //search icon
              color: Colors.white,
              onPressed: () {
                print("Searched");
              }),
          IconButton(
              icon: Icon(Icons.more_vert), //options icon
              color: Colors.white,
              onPressed: () {
                print("Options");
              })
        ],
      ),
      body: Center(
          child: Text(
        "Body of App",
        style: TextStyle(
            fontSize: 45.0, 
            fontWeight: FontWeight.bold, 
            color: Colors.white),
      )),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: 0, //which icon to be selected default
          fixedColor: Colors.black, //color of selected icon
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Collections",
              icon: Icon(Icons.collections),
            ),
          ],
          onTap: (int index) {
            print(index.toString());
          }),
    );
  }
}
