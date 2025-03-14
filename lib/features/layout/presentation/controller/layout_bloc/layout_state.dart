import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';

class LayoutState extends Equatable {
  final int selectedIndex;
  final RequestStates selectItemState;

  const LayoutState({
    this.selectedIndex = 0,
    this.selectItemState = RequestStates.initialState,
  });

  LayoutState copyWith({
    int? selectedIndex,
    RequestStates? selectItemState,
  }) =>
      LayoutState(
          selectedIndex: selectedIndex ?? this.selectedIndex,
          selectItemState: selectItemState ?? this.selectItemState);

  @override
  List<Object> get props => [
        selectedIndex,
        selectItemState,
      ];
}
