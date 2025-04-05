import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/details/domain/entities/details.dart';

class DetailsState extends Equatable {
  final RequestStates changeSliderState;
  final int index;

  final RequestStates getDetailsState;
  final Details? getDetailsResponse;
  final String getDetailsErrMessage;

  const DetailsState({
    this.changeSliderState = RequestStates.initialState,
    this.index = 0,
    this.getDetailsState = RequestStates.loadingState,
    this.getDetailsResponse,
    this.getDetailsErrMessage = '',
  });

  DetailsState copyWith({
    RequestStates? changeSliderState,
    int? index,
    RequestStates? getDetailsState,
    Details? getDetailsResponse,
    String? getDetailsErrMessage,
  }) =>
      DetailsState(
        changeSliderState: changeSliderState ?? this.changeSliderState,
        index: index ?? this.index,
        getDetailsState: getDetailsState ?? this.getDetailsState,
        getDetailsResponse: getDetailsResponse ?? this.getDetailsResponse,
        getDetailsErrMessage: getDetailsErrMessage ?? this.getDetailsErrMessage,
      );

  @override
  List<Object?> get props => [
        changeSliderState,
        index,
        getDetailsState,
        getDetailsResponse,
        getDetailsErrMessage,
      ];
}
