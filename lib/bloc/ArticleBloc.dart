import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_news/api/Service.dart';
import 'package:global_news/bloc/ArticleEvent.dart';
import 'package:global_news/bloc/ArticleState.dart';
import 'package:global_news/model/news_model.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  NewsApi repository;

  ArticleBloc({@required this.repository}) : super(null);

  @override
  // TODO: implement initialState
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticleEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles> articles = await repository.getArticles();
        yield ArticleLoadedState(articles: articles);
        print(articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }
}
