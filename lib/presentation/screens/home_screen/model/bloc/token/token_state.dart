part of 'token_bloc.dart';

abstract class TokenState extends Equatable {
  const TokenState();

  @override
  List<Object> get props => [];
}

class StateTokenInitial extends TokenState {}

// Authen Token
class StateTokenAuthenIsReady extends TokenState {}

class StateTokenAuthenIsRefresh extends TokenState {}

class StateTokenAuthenBeforeExpire extends TokenState {}

class StateTokenAuthenIsExpire extends TokenState {
  @override
  List<Object> get props => [];
}

// SubAuthen Token
class StateSubTokenAuthenIsReady extends TokenState {}

class StateSubTokenAuthenIsRefresh extends TokenState {}

class StateSubTokenAuthenBeforeExpire extends TokenState {}

class StateSubTokenAuthenIsExpire extends TokenState {}
