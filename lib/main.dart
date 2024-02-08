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
          title: Text('Scrollable List'),
        ),
        body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${names[index]}'),
            );
          },
        ),
      ),
    );
  }
}

// Example list.
List<String> names = ["1.Satya","2.Zubair","3.Prakash","4.Jothika","5.Adhithya",
                      "6.Smily","7.Thiru","8.Solomon","9.Nellai","10.Abishek","11.Siva",
                      "12.Kabila","13.Golang","14.Java","15.Python","16.Flutter","17.PHP"]; 