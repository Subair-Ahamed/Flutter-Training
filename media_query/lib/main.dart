import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget Portrait() {
    return Center(
      child: Text(
        "Portrait",
        style: TextStyle(color: Colors.black, fontSize: 45),
      ),
    );
  }

    Widget Landscape() {
    return Center(
      child: Text(
        "Landscape",
        style: TextStyle(color: Colors.red, fontSize: 45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Media Query",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(color: Colors.yellow),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(color: Colors.purple),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ]),
            OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                return Landscape();
              } else {
                return Portrait();
              }
            })
          ],
        ),
      ),
    );
  }
}
