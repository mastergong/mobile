part of 'app_router_bloc.dart';

abstract class AppRouterEvent extends Equatable {
  const AppRouterEvent();

  @override
  List<Object> get props => [];
}

class AppRouteChange extends AppRouterEvent {
  const AppRouteChange();

  @override
  List<Object> get props => [];
}
