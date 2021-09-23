import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginEmailChange extends LoginEvent {
  final String email;

  LoginEmailChange({this.email});

  @override
  List<Object> get props => [email];
}

class LoginPasswordChange extends LoginEvent {
  final String password;

  LoginPasswordChange({this.password});

  @override
  List<Object> get props => [password];
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email, password;

  LoginWithCredentialsPressed({this.email, this.password});

  @override
  List<Object> get props => [email,password];
}
