import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class DisplayLanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Language'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<AppState>(
              builder: (context, appState, _) => Text(
                'Selected Language: ${appState.selectedLanguage}',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go back",style: TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),)
        ],
      ),
    );
  }
}
