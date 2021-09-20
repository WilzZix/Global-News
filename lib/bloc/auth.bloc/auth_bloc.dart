import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_news/bloc/auth.bloc/auth_event.dart';
import 'package:global_news/bloc/auth.bloc/auth_state.dart';
import 'package:global_news/repositories/user_repositories.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  AuthenticationBloc({UserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStarted) {
    } else if (event is AuthenticationLoggedIn) {
    } else if (event is AuthenticationLoggedOut) {}
  }
}
