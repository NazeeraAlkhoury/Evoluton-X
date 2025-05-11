import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';

class AllPlayers extends Equatable {
  final String msg;
  final List<Player> data;

  const AllPlayers({required this.msg, required this.data});

  @override
  List<Object?> get props => [msg, data];
}
