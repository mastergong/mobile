part of 'home_active_bloc.dart';

abstract class HomeActiveState extends Equatable {
  const HomeActiveState();

  @override
  List<Object> get props => [];
}

class StateHomeActiveInitial extends HomeActiveState {}

class StateHomeNotActive extends HomeActiveState {}

class StateHomeActive extends HomeActiveState {}

class StateHomePaused extends HomeActiveState {}
