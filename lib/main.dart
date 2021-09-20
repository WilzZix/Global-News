import 'package:flutter/material.dart';
import 'package:global_news/screens/Tabs/MainTab.dart';
import 'package:global_news/screens/main_screens/welcoming_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
