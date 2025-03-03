import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';

class LayoutState extends Equatable {
  final int newIndex;
  final RequestStates selectItemState;

  const LayoutState({
    this.newIndex = 0,
    this.selectItemState = RequestStates.initialState,
  });

  LayoutState copyWith({
    int? newIndex,
    RequestStates? selectItemState,
  }) =>
      LayoutState(
          newIndex: newIndex ?? this.newIndex,
          selectItemState: selectItemState ?? this.selectItemState);

  @override
  List<Object> get props => [
        newIndex,
        selectItemState,
      ];
}
