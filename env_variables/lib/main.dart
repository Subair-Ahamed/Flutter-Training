import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  print(dotenv.env['API_KEY']); // Accessing API_KEY
  print(dotenv.env['BASE_URL']); // Accessing BASE_URL
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String apiKey = dotenv.env['API_KEY']!;
    final String baseUrl = dotenv.env['BASE_URL']!;
    final bool isDebug = dotenv.env['DEBUG'] == 'true';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Env example"),
        ),
        body: Center(
            child: Column(
          children: [Text('$apiKey'), Text('$baseUrl'), Text('$isDebug')],
        )),
      ),
    );
  }
}