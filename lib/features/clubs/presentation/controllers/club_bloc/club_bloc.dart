import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/clubs/domain/usecases/get_club_card_usecase.dart';
import 'package:evoluton_x/features/clubs/domain/usecases/get_clubs_usecase.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_event.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_state.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final GetClubsUsecase getClubsUsecase;
  final GetClubCardUsecase getClubCardUsecase;
  ClubBloc({
    required this.getClubsUsecase,
    required this.getClubCardUsecase,
  }) : super(const ClubState()) {
    on<GetClubsEvent>(_getClubs);
    on<GetClubCardEvent>(_getClubCard);
  }

  FutureOr<void> _getClubCard(event, emit) async {
    emit(
      state.copyWith(
        getClubCardState: RequestStates.loadingState,
      ),
    );
    final result = await getClubCardUsecase(event.clubId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          getClubCardState: RequestStates.failureState,
          getClubCardErrMessage: failure.errorMessage,
        ),
      ),
      (clubCard) => emit(
        state.copyWith(
          getClubCardState: RequestStates.successState,
          clubCard: clubCard,
        ),
      ),
    );
  }

  FutureOr<void> _getClubs(event, emit) async {
    emit(
      state.copyWith(
        getClubsState: RequestStates.loadingState,
      ),
    );
    final result = await getClubsUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(
          getClubsState: RequestStates.failureState,
          getClubsErrMessage: failure.errorMessage,
        ),
      ),
      (clubs) => emit(
        state.copyWith(
          getClubsState: RequestStates.successState,
          clubs: clubs,
        ),
      ),
    );
  }
}
