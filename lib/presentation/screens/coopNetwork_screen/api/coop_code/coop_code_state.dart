part of 'coop_code_bloc.dart';

abstract class CoopCodeState extends Equatable {
  const CoopCodeState();

  @override
  List<Object> get props => [];
}

class CoopCodeInitialState extends CoopCodeState {}

class CoopCodeLoadState extends CoopCodeState {}

class CoopCodeGetState extends CoopCodeState {
  final String coopCode;
  const CoopCodeGetState(this.coopCode);

  @override
  List<Object> get props => [coopCode];
}

class CoopCodeChangeValueState extends CoopCodeState {}

class CoopCodeGetSuccessState extends CoopCodeState {
  final CoopModel coopModel;
  const CoopCodeGetSuccessState(this.coopModel);

  @override
  List<Object> get props => [coopModel];
}

class CoopCodeGetCodeFromStorageState extends CoopCodeState {}

class CoopCodeGetCodeFromStorageSuccessState extends CoopCodeState {
  final String coopCode;

  const CoopCodeGetCodeFromStorageSuccessState(this.coopCode);

  @override
  List<Object> get props => [coopCode];
}

class CoopCodeError extends CoopCodeState {
  final String error;
  const CoopCodeError(this.error);

  @override
  List<Object> get props => [error];
}
