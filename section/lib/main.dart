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
          title: const Text('Header and Title Example',
          style: TextStyle(
            fontWeight: FontWeight.bold
            )
          ),
          backgroundColor: Colors.blue[500],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          
              // Header Section
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.blue[300],
                child: const Text(
                  'Header', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Title Section
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.blue[100],
                  child: const Text(
                    'Title Section',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          
              // Description Section
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '"This is a brief description of the content or the context in which the information is provided. You can add more details here."',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
          
              // Add Info Section
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'This is the information section where you can add more details.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
