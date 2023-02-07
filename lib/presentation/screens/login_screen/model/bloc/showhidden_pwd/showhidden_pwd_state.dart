part of 'showhidden_pwd_bloc.dart';

class ShowHiddenPwdState extends Equatable {
  final bool isHidden;
  const ShowHiddenPwdState({required this.isHidden});

  ShowHiddenPwdState copyWith({bool? isHidden}) {
    return ShowHiddenPwdState(isHidden: isHidden ?? this.isHidden);
  }

  @override
  List<Object> get props => [isHidden];
}
