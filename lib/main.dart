import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Global News"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Latest news',
                ),
                Tab(
                  text: 'Category',
                ),
                Tab(
                  text: 'Saved',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                Card(
                  elevation: 12.0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 200,
                    color: Colors.amber[600],
                    child: Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  ),
                ),
              ]),

              //above first tab views
              //below second tab views

              ListView(
                children: [
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                ],
              ),

              //above second tab views
              //below third tab views
              ListView(
                children: [
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),

              //above third tab views
            ],
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
