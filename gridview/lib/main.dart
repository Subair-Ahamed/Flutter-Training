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
        body: GridView.count(
          physics:BouncingScrollPhysics(),
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 15.0, // Spacing between columns
          mainAxisSpacing: 15.0, // Spacing between rows
          padding: EdgeInsets.all(15.0), 
          children: <Widget>[
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg'),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg'),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg'),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg'),
            Image.asset('assets/mcdonald.jpeg'),
            Image.asset('assets/benz.jpg'),
            Image.asset('assets/lego.jpg'),
            Image.asset('assets/lion.jpeg'),
            Image.asset('assets/mcdonald.jpeg')
            // Add more images as needed
          ],
        ),
      ),
    );
  }
}
