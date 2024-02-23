import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class TextProvider extends ChangeNotifier {
  String _text = '';

  String get text => _text;

  void updateText(String newText) {
    _text = newText;
    notifyListeners();
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TextProvider>(create: (_) => TextProvider()),
        ChangeNotifierProvider<CounterProvider>(
            create: (_) => CounterProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget(), // Displays the current text
            SizedBox(height: 20),
            TextFieldWidget(), // TextField to update the text
            SizedBox(height: 40),
            CounterWidget(), // Display the counter
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TextProvider>(
      builder: (context, textProvider, child) {
        return Text(
          "Data: ${textProvider.text.toUpperCase()}",
          style: TextStyle(fontSize: 24),
        );
      },
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TextProvider>(
      builder: (context, textProvider, child) {
        return SizedBox(
          width: 300,
          child: TextField(
            onChanged: (newText) {
              textProvider.updateText(newText);
            },
            decoration: InputDecoration(
              labelText: 'Enter Text',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(70.0))),
            ),
          ),
        );
      },
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        return Column(
          children: [
            Text(
              'Counter: ${counterProvider.counter}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterProvider.increment();
              },
              child: Text('Increment Counter'),
            ),
          ],
        );
      },
    );
  }
}
