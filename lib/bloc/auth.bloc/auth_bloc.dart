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
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLogedInToState();
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapAuthenticationSignedOutToState();
    }
  }

//Authentication SignedOut
  Stream<AuthenticationState> _mapAuthenticationSignedOutToState() async* {
    yield AuthenticationFailure();
    _userRepository.signOut();
  }

//Authentication logedin

  Stream<AuthenticationState> _mapAuthenticationLogedInToState() async* {
    yield AuthenticationSuccess(await _userRepository.getUser());
  }

//Authentication started
  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    final isSigned = await _userRepository.isSignedIn();
    if (isSigned) {
      final firebaseUser = await _userRepository.getUser();
      yield AuthenticationSuccess(firebaseUser);
    } else {
      yield AuthenticationFailure();
    }
  }
}
