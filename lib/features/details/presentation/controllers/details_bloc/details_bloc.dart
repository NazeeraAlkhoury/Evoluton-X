import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/details/domain/usecases/get_details_usecase.dart';
import 'package:evoluton_x/features/details/domain/usecases/get_player_details_usecase.dart';
import 'package:evoluton_x/features/details/domain/usecases/get_player_statistics_usecase.dart';
import 'package:evoluton_x/features/details/domain/usecases/get_prediction_result_usecase.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_event.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetDetailsUsecase getDetailsUsecase;
  final GetPlayerDetailsUsecase getPlayerDetailsUsecase;
  final GetPlayerStatisticsUsecase getPlayerStatisticsUsecase;
  final GetPredictionResultUseCase getPredictionResultUseCase;

  DetailsBloc({
    required this.getDetailsUsecase,
    required this.getPlayerDetailsUsecase,
    required this.getPlayerStatisticsUsecase,
    required this.getPredictionResultUseCase,
  }) : super(const DetailsState()) {
    on<CarouselItemSelectedEvent>(_getCarouselItemSelectedEvent);
    on<GetDetailsEvent>(_getDetails);
    on<GetPlayerDetailsEvent>(_getPlayerDetails);
    on<GetPlayerStatisticsEvent>(_getPlayerStatistics);
    on<ResetPlayerEvent>(_resetPlayer);
    on<GetPredictionResultEvent>(_getPredictionResult);
  }

  FutureOr<void> _getPredictionResult(event, emit) async {
    emit(
      state.copyWith(
        predictionResultState: RequestStates.loadingState,
        progress: 0.0,
      ),
    );

    double progress = 0.0;
    final stopwatch = Stopwatch()..start();

    final futureResult = getPredictionResultUseCase(event.playerId);

    while (progress < 0.95) {
      await Future.delayed(const Duration(milliseconds: 200));
      progress += 0.02;
      emit(state.copyWith(progress: progress));
    }

    final result = await futureResult;
    stopwatch.stop();

    result.fold(
      (failure) => emit(
        state.copyWith(
          predictionResultState: RequestStates.failureState,
          predictionResultErrMessage: failure.errorMessage,
          progress: 0,
        ),
      ),
      (predictionResult) => emit(
        state.copyWith(
          predictionResultState: RequestStates.successState,
          predictionResult: predictionResult,
          progress: 1.0,
        ),
      ),
    );
  }

  FutureOr<void> _getPlayerStatistics(event, emit) async {
    final result = await getPlayerStatisticsUsecase(event.playerId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          playerStatisticsState: RequestStates.failureState,
          playertStatisticsErrMessage: failure.errorMessage,
        ),
      ),
      (playerStatistics) => emit(
        state.copyWith(
          playerStatisticsState: RequestStates.successState,
          playerStatisticsResponse: playerStatistics,
        ),
      ),
    );
  }

  FutureOr<void> _resetPlayer(event, emit) {
    emit(state.copyWith(
      playerDetailsState: RequestStates.loadingState,
      playerStatisticsState: RequestStates.loadingState,
    ));
  }

  FutureOr<void> _getPlayerDetails(event, emit) async {
    final result = await getPlayerDetailsUsecase(event.playerId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          playerDetailsState: RequestStates.failureState,
          playertDetailsErrMessage: failure.errorMessage,
        ),
      ),
      (playerDetails) => emit(
        state.copyWith(
          playerDetailsState: RequestStates.successState,
          playerDetailsResponse: playerDetails,
        ),
      ),
    );
  }

  FutureOr<void> _getDetails(event, emit) async {
    final result = await getDetailsUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(
            getDetailsState: RequestStates.failureState,
            getDetailsErrMessage: failure.errorMessage),
      ),
      (details) => emit(
        state.copyWith(
          getDetailsState: RequestStates.successState,
          getDetailsResponse: details,
        ),
      ),
    );
  }

  FutureOr<void> _getCarouselItemSelectedEvent(event, emit) {
    emit(
      state.copyWith(
          index: event.newIndex, changeSliderState: RequestStates.successState),
    );
  }
}
