import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_news/api/Service.dart';
import 'package:global_news/bloc/article_bloc/ArticleBloc.dart';
import 'package:global_news/bloc/simple_bloc_observer.dart';
import 'package:global_news/screens/Tabs/TopHeadlineNews.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:global_news/screens/log_in/login_screen.dart';
import 'package:global_news/screens/main_screens/welcoming_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final NewsApi newsApi = NewsApi();

  runApp(
    BlocProvider(
      create: (context) => ArticleBloc(repository: newsApi),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
