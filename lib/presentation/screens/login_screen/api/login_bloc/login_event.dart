part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoggingEvent extends LoginEvent {
  final String membNo;
  final String membPwd;
  const LoggingEvent({required this.membNo, required this.membPwd});

  @override
  List<Object> get props => [membNo, membPwd];
}

class LoginfailedEvent extends LoginEvent {}

class LoginNextEvent extends LoginEvent {}
