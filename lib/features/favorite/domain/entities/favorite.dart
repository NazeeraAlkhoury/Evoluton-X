import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/favorite/domain/entities/favorite_item_data.dart';

class Favorite extends Equatable {
  final String msg;
  final List<FavoriteItemData> data;

  const Favorite({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
