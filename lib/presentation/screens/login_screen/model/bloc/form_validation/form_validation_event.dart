part of 'form_validation_bloc.dart';

abstract class FormValidationEvent extends Equatable {
  const FormValidationEvent();

  @override
  List<Object> get props => [];
}

//MembNo
class MembNoChangedEvent extends FormValidationEvent {
  const MembNoChangedEvent({required this.membno});

  final String membno;

  @override
  List<Object> get props => [membno];
}

class MembNoUnfocusedEvent extends FormValidationEvent {}

//Password
class PasswordChangedEvent extends FormValidationEvent {
  const PasswordChangedEvent({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocusedEvent extends FormValidationEvent {}

//  FormSubmit
class FormSubmittedEvent extends FormValidationEvent {}
