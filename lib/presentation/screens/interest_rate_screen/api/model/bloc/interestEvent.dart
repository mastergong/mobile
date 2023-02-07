part of 'interestBloc.dart';

abstract class CoopIdEvent extends Equatable {
  const CoopIdEvent();

  @override
  List<Object> get props => [];
}

class GetCoopcodeEvent extends CoopIdEvent {}
