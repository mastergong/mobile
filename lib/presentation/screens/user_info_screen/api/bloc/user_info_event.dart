part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

class EventUserInfoFetching extends UserInfoEvent {
  const EventUserInfoFetching();

  @override
  List<Object> get props => [];
}
