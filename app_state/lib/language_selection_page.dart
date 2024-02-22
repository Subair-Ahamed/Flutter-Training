import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              dropdownColor: Colors.amber[200],
              value: Provider.of<AppState>(context).selectedLanguage,
              onChanged: (String? newValue) {
                //This retrieves the AppState instance from the nearest ancestor ChangeNotifierProvider in the widget tree.
                //The listen: false parameter tells the Provider not to rebuild the widget when the AppState changes.
                Provider.of<AppState>(context, listen: false)
                    .setLanguage(newValue!);
              },
              items: <String>['English', 'Spanish', 'French', 'German']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
                
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  Navigator.of(context).pushNamed("/displayLanguage");
                },
                child: Text("Submit",style: TextStyle(color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
}
