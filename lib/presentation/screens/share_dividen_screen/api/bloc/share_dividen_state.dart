part of 'share_dividen_bloc.dart';

abstract class ShareDividenState extends Equatable {
  const ShareDividenState();

  @override
  List<Object> get props => [];
}

class StateShareDividenInitial extends ShareDividenState {}

class StateShareDividenFetching extends ShareDividenState {
  const StateShareDividenFetching();

  @override
  List<Object> get props => [];
}

class StateShareDividenFetchSuccess extends ShareDividenState {
  // final List<ShareDividenData> shareDividens;
  final ShareDividens shareDividens;
  const StateShareDividenFetchSuccess(this.shareDividens);

  @override
  List<Object> get props => [shareDividens];
}

class StateShareDividenFetchFail extends ShareDividenState {
  final ShareDividenData shareDividenFail;
  const StateShareDividenFetchFail(this.shareDividenFail);

  @override
  List<Object> get props => [shareDividenFail];
}

class StateShareDividenFetchError extends ShareDividenState {
  final String error;
  const StateShareDividenFetchError(this.error);

  @override
  List<Object> get props => [error];
}
