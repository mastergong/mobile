part of 'token_bloc.dart';

abstract class EventToken extends Equatable {
  const EventToken();

  @override
  List<Object> get props => [];
}

class EvenTokenIsReady extends EventToken {}

class EvenTokenIsExpire extends EventToken {}

class EvenSubTokenIsExpire extends EventToken {}
