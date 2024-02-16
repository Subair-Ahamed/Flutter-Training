import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedItem = 'Java';
  List<String> _dropdownItems = [
    'Java',
    'Python',
    'Flutter',
    'React',
    'Golang'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          title: Text('Simple Dropdown Example'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 260.0, left: 150.0),
          child: Column(
            children: [
              DropdownButton<String>(
                value: _selectedItem,
                dropdownColor: Colors.yellow[300],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                  });
                },
                style: TextStyle(color: Colors.black), // Customize text color
                elevation: 50,
                //underline: Container(), // Remove the underline
                iconSize: 30,
                iconEnabledColor: Colors.black,
                items: _dropdownItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                _selectedItem,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900,color: Colors.black),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Contact"),
          ],
          onTap: (int index) {
            print("Current index: $index");
          },
        ),
      ),
    );
  }
}
