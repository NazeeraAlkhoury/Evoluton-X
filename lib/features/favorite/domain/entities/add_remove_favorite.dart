import 'package:equatable/equatable.dart';

class AddRemoveFavorite extends Equatable {
  final String msg;
  final String data;

  const AddRemoveFavorite({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
