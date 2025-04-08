import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/add_player_to_favorite_usecase.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/remove_player_from_favorite_usecase.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_event.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddPlayerToFavoriteUsecase addPlayerToFavoriteUsecase;
  final RemovePlayerFromFavoriteUsecase removePlayerFromFavoriteUsecase;
  FavoriteBloc({
    required this.addPlayerToFavoriteUsecase,
    required this.removePlayerFromFavoriteUsecase,
  }) : super(const FavoriteState()) {
    on<AddPlayerToFavoritesEvent>((event, emit) async {
      final result = await addPlayerToFavoriteUsecase(const NoParameters());
      result.fold(
        (failure) => emit(
          state.copyWith(
            isFavorite: true,
            addtoFavState: RequestStates.failureState,
            addtoFavoriteErrMsg: failure.errorMessage,
          ),
        ),
        (addtoFavResponse) => emit(
          state.copyWith(
            addtoFavState: RequestStates.successState,
            addtoFavResponse: addtoFavResponse,
          ),
        ),
      );
    });
    on<RemovePlayerFromFavoritesEvent>((event, emit) async {
      final result = await removePlayerFromFavoriteUsecase(event.idPlayer);
      result.fold(
        (failure) => emit(
          state.copyWith(
            isFavorite: true,
            addtoFavState: RequestStates.failureState,
            addtoFavoriteErrMsg: failure.errorMessage,
          ),
        ),
        (addtoFavResponse) => emit(
          state.copyWith(
            addtoFavState: RequestStates.successState,
            addtoFavResponse: addtoFavResponse,
          ),
        ),
      );
    });
  }
}
