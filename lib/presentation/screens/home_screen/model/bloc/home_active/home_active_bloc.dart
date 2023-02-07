import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_active_event.dart';
part 'home_active_state.dart';

class HomeActiveBloc extends Bloc<EventHomeActiveEvent, HomeActiveState> {
  HomeActiveBloc() : super(StateHomeActiveInitial()) {
    on<EventHomeActiveEvent>((event, emit) {});

    on<EventHomeActive>((event, emit) {
      emit(StateHomeActive());
    });

    on<EventHomePaused>((event, emit) {
      emit(StateHomePaused());
    });
  }
}
