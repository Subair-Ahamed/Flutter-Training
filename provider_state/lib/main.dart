import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TextProvider(),
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
            SizedBox(height: 20),
            TextWidget(), // Displays the updated text
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
      builder: (context, provider, child) {
        return Text(
          provider.text,
          style: TextStyle(fontSize: 24),
        );
      },
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextProvider textProvider = Provider.of<TextProvider>(context);

    return SizedBox(
      width: 300,
      child: TextField(
        onChanged: (newText) {
          textProvider.updateText(newText);
        },
        decoration: InputDecoration(
          labelText: 'Enter Text',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45.0))
          ),
        ),
      ),
    );
  }
}

class TextProvider extends ChangeNotifier {
  String _text = 'Hello';

  String get text => _text;

  void updateText(String newText) {
    _text = newText;
    notifyListeners();
  }
}
