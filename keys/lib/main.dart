//In Flutter, keys are used to uniquely identify widgets. They are especially useful in scenarios where widgets are being 
//dynamically added, removed, or reordered within a widget tree, such as when working with lists or managing stateful widgets.

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
          title: Text('Keys Example'),
          backgroundColor: Colors.blue,
        ),
        body: KeyExample(),
      ),
    );
  }
}

class KeyExample extends StatefulWidget {
  @override
  _KeyExampleState createState() => _KeyExampleState();
}

class _KeyExampleState extends State<KeyExample> {
  List<int> numbers = [1, 2, 3, 4, 5];

  void shuffleNumbers() {
    setState(() {
      numbers.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    key: ValueKey(numbers[index]),
                    title: Center(
                      child: Text(
                        'Number "${numbers[index]}"',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: shuffleNumbers,
            child: Text('Shuffle Numbers'),
          ),
        ],
      ),
    );
  }
}
