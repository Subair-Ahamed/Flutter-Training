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
        // leading: IconButton(
        //   icon: Icon(Icons.menu), //menu bar - drawer
        //   onPressed: () {
        //     print("Icon pressed");
        //   },
        // ),
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
      ),
      body: Center(
          child: Text(
        "Body of App",
        style: TextStyle(
            fontSize: 45.0, fontWeight: FontWeight.bold, color: Colors.white),
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(Icons.add),
        onPressed: () {
          print("Add items");
        },
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("SubairAhamed"),
            accountEmail: Text("ahamed490@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("SA", style: TextStyle(color: Colors.yellow)),
            ),
            otherAccountsPictures: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("DS", style: TextStyle(color: Colors.yellow)),
            )],
          ),
          ListTile(
            title: Text("All inboxes"),
            leading: Icon(Icons.mail),
          ),
          Divider(
            height: 0.1,
          ),
                    ListTile(
            title: Text("Promotions"),
            leading: Icon(Icons.local_offer),
          ),
          Divider(
            height: 0.1,
          ),
                    ListTile(
            title: Text("Primary"),
            leading: Icon(Icons.inbox),
          ),
          Divider(
            height: 0.1,
          ),
                    ListTile(
            title: Text("Social"),
            leading: Icon(Icons.people),
          ),
          Divider(
            height: 0.1,
          )
        ]),
      ),
    );
  }
}
