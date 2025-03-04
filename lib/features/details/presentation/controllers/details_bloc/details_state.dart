import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';

class DetailsState extends Equatable {
  final int index;
  final RequestStates changeSliderState;
  const DetailsState({
    this.index = 0,
    this.changeSliderState = RequestStates.initialState,
  });

  DetailsState copyWith({
    int? index,
    RequestStates? changeSliderState,
  }) =>
      DetailsState(
        index: index ?? this.index,
        changeSliderState: changeSliderState ?? this.changeSliderState,
      );

  @override
  List<Object> get props => [index];
}
