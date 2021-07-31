import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_news/model/news_model.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitialState extends ArticleState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadedState extends ArticleState {
  List<Articles> articles;

  ArticleLoadedState({@required this.articles});

  @override
  // TODO: implement props
  List<Object> get props => [articles];

}

class ArticleErrorState extends ArticleState {
  String message;

  ArticleErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
