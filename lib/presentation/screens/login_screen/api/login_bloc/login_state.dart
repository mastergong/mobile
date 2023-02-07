part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoggingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final Login loginResponse;
  const LoginSuccessState(this.loginResponse);

  @override
  List<Object> get props => [loginResponse];
}

class LoginNextPageState extends LoginState {}

class LogOutState extends LoginState {}

class LoginErrorManualState extends LoginState {
  final Loginfailed failed;
  const LoginErrorManualState(this.failed);

  @override
  List<Object> get props => [failed];
}

class LoginErrorMSubanualState extends LoginState {
  final String error;
  const LoginErrorMSubanualState(this.error);

  @override
  List<Object> get props => [error];
}

class LoginErrorState extends LoginState {
  final String error;
  const LoginErrorState(this.error);

  @override
  List<Object> get props => [error];
}
