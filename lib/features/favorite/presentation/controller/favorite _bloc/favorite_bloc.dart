import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/add_player_to_favorite_usecase.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/get_favorite_players.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/remove_player_from_favorite_usecase.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_event.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddPlayerToFavoriteUsecase addPlayerToFavoriteUsecase;
  final RemovePlayerFromFavoriteUsecase removePlayerFromFavoriteUsecase;
  final GetFavoritePlayersUsecase getFavoritePlayersUsecase;
  FavoriteBloc({
    required this.addPlayerToFavoriteUsecase,
    required this.removePlayerFromFavoriteUsecase,
    required this.getFavoritePlayersUsecase,
  }) : super(const FavoriteState()) {
    on<AddPlayerToFavoritesEvent>(_addtoFavorites);
    on<RemovePlayerFromFavoritesEvent>(_removeFromFavorite);
    on<GetFavoritePlayersEvent>(_getFavoritePlayers);
  }

  FutureOr<void> _removeFromFavorite(event, emit) async {
    print('======================= remove');
    final result = await removePlayerFromFavoriteUsecase(event.playerId);
    result.fold(
        (failure) => emit(
              state.copyWith(
                //  isFavorite: !state.isFavorite,
                removeFromFavState: RequestStates.failureState,
                removeFromFavoriteErrMsg: failure.errorMessage,
              ),
            ), (removeFavResponse) {
      emit(
        state.copyWith(
          removeFromFavState: RequestStates.successState,
          removeFromFavResponse: removeFavResponse,
        ),
      );
      //  add(GetFavoritePlayersEvent());
    });
  }

  FutureOr<void> _addtoFavorites(event, emit) async {
    print('======================= add');
    final result = await addPlayerToFavoriteUsecase(event.playerId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          //isFavorite: !state.isFavorite,
          addtoFavState: RequestStates.failureState,
          addtoFavoriteErrMsg: failure.errorMessage,
        ),
      ),
      (addtoFavResponse) => emit(
        state.copyWith(
          // isFavorite: !state.isFavorite,
          addtoFavState: RequestStates.successState,
          addtoFavResponse: addtoFavResponse,
        ),
      ),
    );
  }

  FutureOr<void> _getFavoritePlayers(event, emit) async {
    emit(
      state.copyWith(
        getFavState: RequestStates.loadingState,
        getFavResponse: null,
      ),
    );
    final result = await getFavoritePlayersUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(
          getFavState: RequestStates.failureState,
          getFavoriteErrMsg: failure.errorMessage,
        ),
      ),
      (favResponse) => emit(
        state.copyWith(
          getFavState: RequestStates.successState,
          getFavResponse: favResponse,
        ),
      ),
    );
  }
}
