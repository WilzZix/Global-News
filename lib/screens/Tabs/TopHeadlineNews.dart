import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_news/api/Service.dart';
import 'package:global_news/bloc/article_bloc/ArticleBloc.dart';
import 'package:global_news/bloc/article_bloc/ArticleEvent.dart';
import 'package:global_news/bloc/article_bloc/ArticleState.dart';
import 'package:global_news/model/news_model.dart';

class TopHeadlineNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TopHeadlineNewsState();
}

class _TopHeadlineNewsState extends State<TopHeadlineNews> {
  NewsApi _newsapi = new NewsApi();
  ArticleBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.add(FetchArticleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Material(
            child: Scaffold(
              body: BlocListener<ArticleBloc, ArticleState>(
                listener: (BuildContext context, state) {
                  if (state is ArticleErrorState) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    if (state is ArticleInitialState) {
                      return buildLoading();
                    } else if (state is ArticleLoadingState) {
                      return buildLoading();
                    } else if (state is ArticleLoadedState) {
                      return buildArticleList(state.articles);
                    } else if (state is ArticleErrorState) {
                      return buildErrorUi(state.message);
                    }
                    return Container();
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<Articles> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: ClipOval(
                child: Hero(
                  tag: articles[pos].urlToImage,
                  child: Image.network(
                    articles[pos].urlToImage,
                    fit: BoxFit.cover,
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
              ),
              title: Text(articles[pos].title),
              subtitle: Text(articles[pos].publishedAt),
            ),
            onTap: () {
              navigateToArticleDetailPage(context, articles[pos]);
            },
          ),
        );
      },
    );
  }

  void navigateToArticleDetailPage(BuildContext context, Articles article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArticleDetailPage(
        article: article,
      );
    }));
  }

  void navigateToAoutPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AboutPage();
    }));
  }
// Future<List<Articles>> getArticles(BuildContext context) async {
//   try {
//     await checkInternetConnection(throwError: true);
//   } on NoInternetException catch (ex) {
//     showDialog(context: context, builder: buildCheckInternetDialog());
//     throw ex;
//   } on BadRequestException catch (ex) {
//     showDialog(context: context, builder: buildErrorDialog(ex));
//   }
//   List<Articles> articles;
//   try {
//     articles = await _newsapi.getArticles();
//   } on ServerErrorException catch (ex) {
//     showDialog(context: context, builder: buildErrorDialog(ex));
//     throw ex;
//   }
//   print(articles);
//   return articles;
// }

// @override
// Widget build(BuildContext context) {
//   return FutureBuilder(
//     future: getArticles(context),
//     builder: (BuildContext context, AsyncSnapshot snapshot) {
//       if (snapshot.hasError) {
//         print(
//             "${snapshot.error}<<<<<<<<<<<<<<<<<<<<<<<<===========================SNAPSHOT ERROR");
//         return Container(
//           child: Center(
//             child: Text('Не удалось получить информацию о сотруднике'),
//           ),
//         );
//       }
//       if (snapshot.data == null) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       List<Articles> articles = snapshot.data;
//       return ListView.separated(
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   child: Image.network(articles[index].image),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(),
//               itemCount: articles.length)
//
//           //   Container(
//           //   child: Image.network('https://picsum.photos/250?image=9'),
//           // );
//           ;
//     },
//   );
// }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Developer : newazkabirtaluk@gmail.com"),
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  Articles article;

  ArticleDetailPage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cricket"),
      ),
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          Hero(
            tag: article.urlToImage,
            child: Image.network(article.urlToImage),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              article.title,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(5.0),
            child: Text(article.publishedAt),
          ),
          Text(article.content),
        ],
      ),
    );
  }
}
