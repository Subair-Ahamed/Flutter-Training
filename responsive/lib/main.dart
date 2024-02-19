import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive & Adaptive Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Responsive & Adaptive Example'),
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        //The LayoutBuilder widget takes a builder function as its argument. This function is called every time the layout changes. 
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) { //These are helper methods that return widgets representing the vertical and horizontal layouts.
              return buildVerticalLayout();
            } else {
              return buildHorizontalLayout();
            }
          },
        ),
      ),
    );
  }

  Widget buildVerticalLayout() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.phone_iphone,
          size: 100,
          color: Colors.blue,
        ),
        SizedBox(height: 20),
        Text(
          'Vertical Layout',
          style: TextStyle(fontSize: 25,color: Colors.white),
        ),
      ],
    );
  }

  Widget buildHorizontalLayout() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.computer,
          size: 100,
          color: Colors.green,
        ),
        SizedBox(width: 20),
        Text(
          'Horizontal Layout',
          style: TextStyle(fontSize: 25,color: Colors.white),
        ),
      ],
    );
  }
}
