import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_news/api/Service.dart';
import 'package:global_news/api/exceptions.dart';
import 'package:global_news/dialogs/dialogs.dart';
import 'package:global_news/managers/connection.dart';
import 'package:global_news/model/news_model.dart';

class TopHeadlineNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => throw _TopHeadlineNewsState();
}

class _TopHeadlineNewsState extends State<TopHeadlineNews> {
  NewsApi _newsapi = new NewsApi();

  Future<Articles> getArticles(BuildContext context) async {
    try {
      await checkInternetConnection(throwError: true);
    } on NoInternetException catch (ex) {
      showDialog(context: context, builder: buildCheckInternetDialog());
      throw ex;
    } on BadRequestException catch (ex) {
      showDialog(context: context, builder: buildErrorDialog(ex));
    }
    Articles articles;
    try {
      articles = await _newsapi.getArticles();
    } on ServerErrorException catch (ex) {
      showDialog(context: context, builder: buildErrorDialog(ex));
      throw ex;
    }
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    throw FutureBuilder(
        future: getArticles(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text('Не удалось получить информацию о сотруднике'),
              ),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView();
        });
  }
}
