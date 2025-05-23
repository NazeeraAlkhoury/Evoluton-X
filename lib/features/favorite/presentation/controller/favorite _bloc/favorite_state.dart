import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite.dart';

class FavoriteState extends Equatable {
  final RequestStates addtoFavState;
  final AddRemoveFavorite? addtoFavResponse;
  final String addtoFavoriteErrMsg;

  final RequestStates removeFromFavState;
  final AddRemoveFavorite? removeFromFavResponse;
  final String removeFromFavoriteErrMsg;

  final RequestStates getFavState;
  final Favorite? getFavResponse;
  final String getFavoriteErrMsg;

  const FavoriteState({
    this.addtoFavState = RequestStates.initialState,
    this.addtoFavResponse,
    this.addtoFavoriteErrMsg = '',
    this.removeFromFavState = RequestStates.initialState,
    this.removeFromFavResponse,
    this.removeFromFavoriteErrMsg = '',
    this.getFavState = RequestStates.initialState,
    this.getFavResponse,
    this.getFavoriteErrMsg = '',
  });

  FavoriteState copyWith({
    RequestStates? addtoFavState,
    AddRemoveFavorite? addtoFavResponse,
    String? addtoFavoriteErrMsg,
    RequestStates? removeFromFavState,
    AddRemoveFavorite? removeFromFavResponse,
    String? removeFromFavoriteErrMsg,
    RequestStates? getFavState,
    Favorite? getFavResponse,
    String? getFavoriteErrMsg,
  }) =>
      FavoriteState(
        addtoFavState: addtoFavState ?? this.addtoFavState,
        addtoFavResponse: addtoFavResponse ?? this.addtoFavResponse,
        addtoFavoriteErrMsg: addtoFavoriteErrMsg ?? this.addtoFavoriteErrMsg,
        removeFromFavState: removeFromFavState ?? this.removeFromFavState,
        removeFromFavResponse:
            removeFromFavResponse ?? this.removeFromFavResponse,
        removeFromFavoriteErrMsg:
            removeFromFavoriteErrMsg ?? this.removeFromFavoriteErrMsg,
        getFavState: getFavState ?? this.getFavState,
        getFavResponse: getFavResponse ?? this.getFavResponse,
        getFavoriteErrMsg: getFavoriteErrMsg ?? this.getFavoriteErrMsg,
      );

  @override
  List<Object?> get props => [
        addtoFavState,
        addtoFavResponse,
        removeFromFavState,
        removeFromFavResponse,
        addtoFavoriteErrMsg,
        removeFromFavoriteErrMsg,
        getFavState,
        getFavResponse,
        getFavoriteErrMsg,
      ];
}
