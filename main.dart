import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  String input = "Hello";
  void change() {
    setState(() {
      input = "Stateful Widgets";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Text('$input'),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: change,
          )
        ],
      ),
    );
  }
}
