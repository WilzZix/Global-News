import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

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
              ListView(children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    Text("Thu 13,04,2020"),
                    Text(
                      "In N.Y.C.'s Coronavirus Surge,a Frightining Echo of the 1918",
                      style: TextStyle(fontSize: 26.0),
                    ),
                    Text(
                        "U.S. stock futures fell as investors consider quarterly results from four Dow stocks and look ahead to afternoon Netflix earnings and an Apple event."),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: 20,
                        itemBuilder: (BuildContext contex, int index) {
                          return Container(
                            height: 50,
                            color: Colors.amber[colorCodes[1]],
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Wed 21-04 2021'),
                                    Text('Wed 21-04 2021'),
                                  ],
                                ),
                                Image.network(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                              ],
                            ),
                          );
                        })
                  ],
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
