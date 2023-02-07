import 'package:formz/formz.dart';

enum ValidationError { invalid }

class VariableFrom extends FormzInput<String, ValidationError> {
  const VariableFrom.pure([super.value = '']) : super.pure();
  const VariableFrom.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    return value!.isNotEmpty ? null : ValidationError.invalid;
  }
}
