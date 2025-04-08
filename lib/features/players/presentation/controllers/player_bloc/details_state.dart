import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/players/domain/entities/details.dart';
import 'package:evoluton_x/features/players/domain/entities/player_details.dart';
import 'package:evoluton_x/features/players/domain/entities/player_statistics.dart';
import 'package:evoluton_x/features/players/domain/entities/prediction_result.dart';

class PlayerState extends Equatable {
  final RequestStates changeSliderState;
  final int index;

  final RequestStates getDetailsState;
  final Details? getDetailsResponse;
  final String getDetailsErrMessage;

  final RequestStates playerDetailsState;
  final PlayerDetails? playerDetailsResponse;
  final String playertDetailsErrMessage;

  final RequestStates playerStatisticsState;
  final PlayerStatistics? playerStatisticsResponse;
  final String playertStatisticsErrMessage;

  final double? progress;
  final RequestStates predictionResultState;
  final PredictionResult? predictionResult;
  final String predictionResultErrMessage;

  const PlayerState({
    this.changeSliderState = RequestStates.initialState,
    this.index = 0,
    this.getDetailsState = RequestStates.loadingState,
    this.getDetailsResponse,
    this.getDetailsErrMessage = '',
    this.playerDetailsState = RequestStates.loadingState,
    this.playerDetailsResponse,
    this.playertDetailsErrMessage = '',
    this.playerStatisticsState = RequestStates.loadingState,
    this.playerStatisticsResponse,
    this.playertStatisticsErrMessage = '',
    this.progress,
    this.predictionResultState = RequestStates.initialState,
    this.predictionResult,
    this.predictionResultErrMessage = '',
  });

  PlayerState copyWith({
    RequestStates? changeSliderState,
    int? index,
    RequestStates? getDetailsState,
    Details? getDetailsResponse,
    String? getDetailsErrMessage,
    RequestStates? playerDetailsState,
    PlayerDetails? playerDetailsResponse,
    String? playertDetailsErrMessage,
    RequestStates? playerStatisticsState,
    PlayerStatistics? playerStatisticsResponse,
    String? playertStatisticsErrMessage,
    double? progress,
    RequestStates? predictionResultState,
    PredictionResult? predictionResult,
    String? predictionResultErrMessage,
  }) =>
      PlayerState(
        changeSliderState: changeSliderState ?? this.changeSliderState,
        index: index ?? this.index,
        getDetailsState: getDetailsState ?? this.getDetailsState,
        getDetailsResponse: getDetailsResponse ?? this.getDetailsResponse,
        getDetailsErrMessage: getDetailsErrMessage ?? this.getDetailsErrMessage,
        playerDetailsState: playerDetailsState ?? this.playerDetailsState,
        playerDetailsResponse:
            playerDetailsResponse ?? this.playerDetailsResponse,
        playertDetailsErrMessage:
            playertDetailsErrMessage ?? this.playertDetailsErrMessage,
        playerStatisticsState:
            playerStatisticsState ?? this.playerStatisticsState,
        playerStatisticsResponse:
            playerStatisticsResponse ?? this.playerStatisticsResponse,
        playertStatisticsErrMessage:
            playertStatisticsErrMessage ?? this.playertStatisticsErrMessage,
        progress: progress ?? this.progress,
        predictionResultState:
            predictionResultState ?? this.predictionResultState,
        predictionResult: predictionResult ?? this.predictionResult,
        predictionResultErrMessage:
            predictionResultErrMessage ?? this.predictionResultErrMessage,
      );

  @override
  List<Object?> get props => [
        changeSliderState,
        index,
        getDetailsState,
        getDetailsResponse,
        getDetailsErrMessage,
        playerDetailsState,
        playerDetailsResponse,
        playertDetailsErrMessage,
        playerStatisticsState,
        playerStatisticsResponse,
        playertStatisticsErrMessage,
        progress,
        predictionResultState,
        predictionResult,
        predictionResultErrMessage,
      ];
}
