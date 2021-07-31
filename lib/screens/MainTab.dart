import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_news/api/Service.dart';
import 'package:global_news/api/exceptions.dart';
import 'package:global_news/bloc/ArticleBloc.dart';
import 'package:global_news/dialogs/dialogs.dart';
import 'package:global_news/managers/connection.dart';
import 'package:global_news/model/news_model.dart';
import 'package:global_news/screens/Tabs/Category.dart';
import 'package:global_news/screens/Tabs/TopHeadlineNews.dart';
import 'package:http/http.dart';

import 'Tabs/Saved.dart';

class TabWidget extends StatefulWidget {
  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
 final NewsApi repository = NewsApi();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
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
            children: <Widget>[
              BlocProvider<ArticleBloc>(
                  create: (BuildContext context) => ArticleBloc(
                        repository: repository,
                      ),
                  child: TopHeadlineNews()),
              Category(),
              Saved(),
              //Category(),
              //SavedNews(),
            ],
            // ListView(children: [
            //   Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Card(
            //         elevation: 12.0,
            //         child: Container(
            //           padding: EdgeInsets.all(8),
            //           height: 200,
            //           color: Colors.amber[600],
            //           child: Image.network(
            //               'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            //         ),
            //       ),
            //       Text("Thu 13,04,2020"),
            //       Text(
            //         "In N.Y.C.'s Coronavirus Surge,a Frightining Echo of the 1918",
            //         style: TextStyle(fontSize: 26.0),
            //       ),
            //       Text(
            //           "U.S. stock futures fell as investors consider quarterly results from four Dow stocks and look ahead to afternoon Netflix earnings and an Apple event."),
            //       ListView.builder(
            //           physics: NeverScrollableScrollPhysics(),
            //           shrinkWrap: true,
            //           padding: const EdgeInsets.all(8),
            //           itemCount: 20,
            //           itemBuilder: (BuildContext contex, int index) {
            //             return Container(
            //               height: 50,
            //               child: Row(
            //                 children: [
            //                   Column(
            //                     children: [
            //                       Text('Wed 21-04 2021'),
            //                       Text('Wed 21-04 2021'),
            //                     ],
            //                   ),
            //                   Image.network(
            //                       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            //                 ],
            //               ),
            //             );
            //           })
            //     ],
            //   ),
            // ]),
            //
            // //above first tab views
            // //below second tab views
            //
            // ListView(
            //   children: [
            //     Container(
            //       height: 50,
            //       color: Colors.amber[500],
            //       child: const Center(child: Text('Entry B')),
            //     ),
            //   ],
            // ),
            //
            // //above second tab views
            // //below third tab views
            // ListView(
            //   children: [
            //     Container(
            //       height: 50,
            //       color: Colors.amber[100],
            //       child: const Center(child: Text('Entry C')),
            //     ),
            //   ],
            // ),
            //
            // //above third tab views
          ),
        ),
      ),
    );
  }
}
