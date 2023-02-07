part of 'showhidden_pwd_bloc.dart';

abstract class ShowHiddenPwdEvent extends Equatable {
  const ShowHiddenPwdEvent();

  @override
  List<Object?> get props => [];
}

class HiddenPwdEvent extends ShowHiddenPwdEvent {}

class ShowPwdEvent extends ShowHiddenPwdEvent {}
