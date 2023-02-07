part of 'coop_code_bloc.dart';

abstract class CoopIdEvent extends Equatable {
  const CoopIdEvent();

  @override
  List<Object> get props => [];
}

class GetCoopcodeEvent extends CoopIdEvent {
  final String coopCode;

  const GetCoopcodeEvent({required this.coopCode});

  @override
  List<Object> get props => [coopCode];
}

class GetCoopcodeChangeTextEvent extends CoopIdEvent {
  @override
  List<Object> get props => [];
}

class GetCoopcodeFromStorageEvent extends CoopIdEvent {
  final String coopCode;

  const GetCoopcodeFromStorageEvent({required this.coopCode});

  @override
  List<Object> get props => [coopCode];
}
