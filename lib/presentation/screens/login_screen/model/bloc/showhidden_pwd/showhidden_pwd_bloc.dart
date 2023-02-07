import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'showhidden_pwd_event.dart';
part 'showhidden_pwd_state.dart';

class ShowHiddenPwdBloc extends Bloc<ShowHiddenPwdEvent, ShowHiddenPwdState> {
  ShowHiddenPwdBloc() : super(const ShowHiddenPwdState(isHidden: true)) {
    on<HiddenPwdEvent>(_onHiden);
    on<ShowPwdEvent>(_onShow);
    // on<ViewpassEventShow>((event, emit) {
    //   emit(state.copyWith(isHidden: true));
    // });
  }

  void _onHiden(
    HiddenPwdEvent event,
    Emitter<ShowHiddenPwdState> emit,
  ) {
    emit(state.copyWith(isHidden: false));
  }

  void _onShow(
    ShowPwdEvent event,
    Emitter<ShowHiddenPwdState> emit,
  ) {
    emit(state.copyWith(isHidden: true));
  }
}
