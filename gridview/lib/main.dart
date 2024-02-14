import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View with Images',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(171, 229, 240, 0.996),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Grid View with Images'),
        ),
        drawer: const Drawer(
          backgroundColor: Color.fromARGB(255, 228, 213, 213),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                accountName: Text(
                  "Adhithya",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("adhi@gmail.com",
                    style: TextStyle(color: Colors.black)),
                currentAccountPicture: CircleAvatar(
                  child: Text("AD"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    child: Text("PM"),
                  ),
                  CircleAvatar(
                    child: Text("SA"),
                  )
                ],
                
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home)
              ),
              Divider(height: 10,color: Colors.black),
              ListTile(
                title: Text("More Apps"),
                leading: Icon(Icons.app_registration)
              ),
              Divider(height: 10,color: Colors.black),
              ListTile(
                title: Text("Contact"),
                leading: Icon(Icons.phone)
              ),
              Divider(height: 10,color: Colors.black),
            ],
          ),
        ),
        body: GridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 15.0, // Spacing between columns
          mainAxisSpacing: 15.0, // Spacing between rows
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg', fit: BoxFit.cover),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg', fit: BoxFit.cover),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg', fit: BoxFit.cover),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg', fit: BoxFit.cover),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg', fit: BoxFit.cover),
            Image.asset('assets/mcdonald.jpeg')
            // Add more images as needed
          ],
        ),
      ),
    );
  }
}
