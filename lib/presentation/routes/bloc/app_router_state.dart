part of 'app_router_bloc.dart';

abstract class AppRouterState extends Equatable {
  const AppRouterState();

  @override
  List<Object> get props => [];
}

class RouterInitial extends AppRouterState {}

class AppRouterScreen extends AppRouterState {}
