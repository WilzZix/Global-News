import 'package:flutter/material.dart';
import 'package:global_news/screens/MainTab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabWidget(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
