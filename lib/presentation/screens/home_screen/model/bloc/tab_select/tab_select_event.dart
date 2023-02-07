part of 'tab_select_bloc.dart';

abstract class TabSelectEvent extends Equatable {
  final int indexSelect;
  const TabSelectEvent(this.indexSelect);

  @override
  List<Object> get props => [indexSelect];
}

class SelectEven extends TabSelectEvent {
  const SelectEven(super.indexSelect);
}
