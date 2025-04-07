import 'package:evoluton_x/features/favorite/domain/entities/add_remove_favorite.dart';

class AddRemoveFavoriteModel extends AddRemoveFavorite {
  const AddRemoveFavoriteModel({
    required super.msg,
    required super.data,
  });

  factory AddRemoveFavoriteModel.fromJson(Map<String, dynamic> json) =>
      AddRemoveFavoriteModel(
        msg: json['msg'],
        data: json['data'],
      );
}
