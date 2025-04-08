import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/enums.dart';
import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';

class FavoriteState extends Equatable {
  final bool isFavorite;

  final RequestStates addtoFavState;
  final AddRemoveFavorite? addtoFavResponse;
  final String addtoFavoriteErrMsg;

  final RequestStates removeFromFavState;
  final AddRemoveFavorite? removeFromFavResponse;
  final String removeFromFavoriteErrMsg;
  const FavoriteState({
    this.isFavorite = false,
    this.addtoFavState = RequestStates.initialState,
    this.addtoFavResponse,
    this.addtoFavoriteErrMsg = '',
    this.removeFromFavState = RequestStates.initialState,
    this.removeFromFavResponse,
    this.removeFromFavoriteErrMsg = '',
  });

  FavoriteState copyWith({
    bool? isFavorite,
    RequestStates? addtoFavState,
    AddRemoveFavorite? addtoFavResponse,
    String? addtoFavoriteErrMsg,
    RequestStates? removeFromFavState,
    AddRemoveFavorite? removeFromFavResponse,
    String? removeFromFavoriteErrMsg,
  }) =>
      FavoriteState(
        isFavorite: isFavorite ?? this.isFavorite,
        addtoFavState: addtoFavState ?? this.addtoFavState,
        addtoFavResponse: addtoFavResponse ?? this.addtoFavResponse,
        addtoFavoriteErrMsg: addtoFavoriteErrMsg ?? this.addtoFavoriteErrMsg,
        removeFromFavState: removeFromFavState ?? this.removeFromFavState,
        removeFromFavResponse:
            removeFromFavResponse ?? this.removeFromFavResponse,
        removeFromFavoriteErrMsg:
            removeFromFavoriteErrMsg ?? this.removeFromFavoriteErrMsg,
      );

  @override
  List<Object?> get props => [
        isFavorite,
        addtoFavState,
        addtoFavResponse,
        removeFromFavState,
        removeFromFavResponse,
        addtoFavoriteErrMsg,
        removeFromFavoriteErrMsg,
      ];
}
