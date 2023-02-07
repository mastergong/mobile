part of 'tab_select_bloc.dart';

class TabSelectState extends Equatable {
  final int indexSelect;
  const TabSelectState({required this.indexSelect});

  TabSelectState copyWith({int? indexSelect}) {
    return TabSelectState(indexSelect: indexSelect ?? this.indexSelect);
  }

  @override
  List<Object> get props => [indexSelect];
}
