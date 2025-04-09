import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/clubs/domain/usecases/get_clubs_usecase.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_event.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_state.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final GetClubsUsecase getClubsUsecase;
  ClubBloc({required this.getClubsUsecase}) : super(const ClubState()) {
    on<GetClubsEvent>((event, emit) async {
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
    });
  }
}
