import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:formz/formz.dart';
import '../../../event/login_widget_event.dart';
import '../../variable/VariableForm.dart';

part 'form_validation_event.dart';
part 'form_validation_state.dart';

class FormValidateBloc extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidateBloc() : super(const FormValidationState()) {
    on<MembNoChangedEvent>(_onmembNoChanged);
    on<MembNoUnfocusedEvent>(_onmembNoUnfocused);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<PasswordUnfocusedEvent>(_onPasswordUnfocused);
    on<FormSubmittedEvent>(_onFormSubmitted);
  }

  void _onmembNoChanged(
      MembNoChangedEvent event, Emitter<FormValidationState> emit) {
    final membno = VariableFrom.dirty(event.membno);

    emit(
      state.copyWith(
        membno: membno.valid ? membno : VariableFrom.pure(event.membno),
        status: Formz.validate([membno, state.password]),
      ),
    );
  }

  void _onmembNoUnfocused(
      MembNoUnfocusedEvent event, Emitter<FormValidationState> emit) {
    final membno = VariableFrom.dirty(state.membno.value.isNotEmpty
        ? state.membno.value.padLeft(5, '0') != '00000'
            ? state.membno.value.padLeft(5, '0')
            : ""
        : state.membno.value);

//  update UI Text
    ctrTextusername.text = membno.value;
    emit(
      state.copyWith(
        membno: membno,
        status: Formz.validate([membno, state.password]),
      ),
    );
  }

  void _onPasswordChanged(
      PasswordChangedEvent event, Emitter<FormValidationState> emit) {
    final password = VariableFrom.dirty(event.password);
    emit(
      state.copyWith(
        password: password.valid ? password : VariableFrom.pure(event.password),
        status: Formz.validate([state.membno, password]),
      ),
    );
  }

  void _onPasswordUnfocused(
    PasswordUnfocusedEvent event,
    Emitter<FormValidationState> emit,
  ) {
    final password = VariableFrom.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.membno, password]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmittedEvent event,
    Emitter<FormValidationState> emit,
  ) async {
    final membno = VariableFrom.dirty(state.membno.value);
    final password = VariableFrom.dirty(state.password.value);
    emit(
      state.copyWith(
        membno: membno,
        password: password,
        status: Formz.validate([membno, password]),
      ),
    );
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
