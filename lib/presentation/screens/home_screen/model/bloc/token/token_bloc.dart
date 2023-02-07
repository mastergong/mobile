import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../data/models_json/token.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<EventToken, TokenState> {
  TokenBloc() : super(StateTokenInitial()) {
    //  on<EventToken>((event, emit) {});
    on<EvenTokenIsExpire>((event, emit) async {
      emit(StateTokenAuthenIsExpire());
    });
    on<EvenSubTokenIsExpire>((event, emit) {
      emit(StateSubTokenAuthenIsExpire());
    });

    on<EvenTokenIsReady>((event, emit) {
      emit(StateTokenAuthenIsReady());
    });
  }
}
