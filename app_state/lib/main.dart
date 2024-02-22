import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'language_selection_page.dart';
import 'display_language_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Language App',
        initialRoute: '/',
        routes: {
          '/': (context) => LanguageSelectionPage(),
          '/displayLanguage': (context) => DisplayLanguagePage(),
        },
      ),
    );
  }
}
