import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_news/bloc/auth.bloc/auth_bloc.dart';
import 'package:global_news/bloc/simple_bloc_observer.dart';
import 'package:global_news/repositories/user_repositories.dart';
import 'package:global_news/screens/main_screens/welcoming_screen.dart';

import 'screens/main_screens/welcoming_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  MyApp({UserRepository userRepository}) : _userRepository = userRepository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
