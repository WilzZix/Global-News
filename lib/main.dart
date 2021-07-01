import 'package:flutter/material.dart';
import 'package:global_news/screens/MainTab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabWidget(colorCodes: colorCodes),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
