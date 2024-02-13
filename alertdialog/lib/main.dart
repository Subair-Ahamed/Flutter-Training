import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wrap with MaterialApp
      home: MyAppContent(),
    );
  }
}

class MyAppContent extends StatefulWidget {
  const MyAppContent({Key? key}) : super(key: key);

  @override
  _MyAppContentState createState() => _MyAppContentState();
}

class _MyAppContentState extends State<MyAppContent> {
  Future<void> showAlertDialog(BuildContext context, String msg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Text(msg,style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok",style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body:  Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 20.0,
            backgroundColor: Colors.red, // bg color
          ),
          child: const Text("Click me", style: TextStyle(color: Colors.white)),
          onPressed: () {
            showAlertDialog(context, "This is alert box");
          },
        ),
      ),
    );
  }
}
