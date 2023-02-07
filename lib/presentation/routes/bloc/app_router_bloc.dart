import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_router_event.dart';
part 'app_router_state.dart';

class AppRouterBloc extends Bloc<AppRouterEvent, AppRouterState> {
  AppRouterBloc() : super(RouterInitial()) {
    on<AppRouterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AppRouteChange>((event, emit) {
      // TODO: implement event handler
    });
  }
}
