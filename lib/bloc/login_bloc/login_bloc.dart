import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_news/bloc/login_bloc/login_event.dart';
import 'package:global_news/bloc/login_bloc/login_state.dart';
import 'package:global_news/repositories/user_repositories.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc(this._userRepository) : super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // if (event is LoginEmailChange) {
    //   yield 
    // }
  }
}
