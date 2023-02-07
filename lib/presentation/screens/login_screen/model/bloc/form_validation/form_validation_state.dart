part of 'form_validation_bloc.dart';

class FormValidationState extends Equatable {
  const FormValidationState({
    this.membno = const VariableFrom.pure(),
    this.password = const VariableFrom.pure(),
    this.status = FormzStatus.pure,
  });

  final VariableFrom membno;
  final VariableFrom password;
  final FormzStatus status;

  FormValidationState copyWith({
    VariableFrom? membno,
    VariableFrom? password,
    FormzStatus? status,
  }) {
    return FormValidationState(
      membno: membno ?? this.membno,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [membno, password, status];
}

class FormUserValidation extends FormValidationState {
  final String userMembno;

  const FormUserValidation({required this.userMembno});
  @override
  List<Object> get props => [userMembno];
}
