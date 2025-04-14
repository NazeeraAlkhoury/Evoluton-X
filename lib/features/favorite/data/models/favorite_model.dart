import 'package:evoluton_x/features/favorite/data/models/favorite_item_data_model.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite_item_data.dart';

class FavoriteModel extends Favorite {
  const FavoriteModel({
    required super.msg,
    required super.data,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        msg: json['msg'],
        data: json['data'] != null
            ? List<FavoriteItemData>.from((json['data'] as List).map(
                (favorite) => FavoriteItemDataModel.fromJson(favorite),
              ))
            : [],
      );
}
