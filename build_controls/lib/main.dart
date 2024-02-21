// In Flutter, you can build controls with size relative to their parent widget using various approaches
// or by simply using Container with width and height properties set relative to parent constraints.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Relative Size Demo'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 300.0,
            height: 300.0,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Calculate width and height relative to parent size
                double width = constraints.maxWidth * 0.8;
                double height = constraints.maxHeight * 0.5;

                return Container(
                  width: width,
                  height: height,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Relative Size',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
