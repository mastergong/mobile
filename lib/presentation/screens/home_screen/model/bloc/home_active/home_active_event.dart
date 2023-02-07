part of 'home_active_bloc.dart';

abstract class EventHomeActiveEvent extends Equatable {
  const EventHomeActiveEvent();

  @override
  List<Object> get props => [];
}

class EventHomeActive extends EventHomeActiveEvent {}

class EventHomePaused extends EventHomeActiveEvent {}
