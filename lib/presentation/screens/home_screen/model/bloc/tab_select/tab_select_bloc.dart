import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_select_event.dart';
part 'tab_select_state.dart';

class TabSelectBloc extends Bloc<TabSelectEvent, TabSelectState> {
  TabSelectBloc() : super(const TabSelectState(indexSelect: 0)) {
    on<SelectEven>((event, emit) {
      emit(state.copyWith(indexSelect: event.indexSelect));
    });
  }
}
