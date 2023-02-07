part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class StateUserInfoInitial extends UserInfoState {}

class StateUserInfoFetching extends UserInfoState {
  const StateUserInfoFetching();

  @override
  List<Object> get props => [];
}

class StateUserInfoFetchSuccess extends UserInfoState {
  final UserInfoData userInfoResponse;

  const StateUserInfoFetchSuccess(this.userInfoResponse);

  @override
  List<Object> get props => [userInfoResponse];
}

class StateUserInfoFetchFail extends UserInfoState {
  final UserInfoData userInfoResponseFail;
  const StateUserInfoFetchFail(this.userInfoResponseFail);

  @override
  List<Object> get props => [userInfoResponseFail];
}

class StateUserInfoFetchError extends UserInfoState {
  final String error;
  const StateUserInfoFetchError(this.error);

  @override
  List<Object> get props => [error];
}
