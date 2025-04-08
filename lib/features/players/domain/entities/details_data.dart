import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/players/domain/entities/club.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';

class DetailsData extends Equatable {
  final List<Player> suggested;
  final List<Club> bestClubs;

  const DetailsData({
    required this.suggested,
    required this.bestClubs,
  });

  @override
  List<Object?> get props => [
        suggested,
        bestClubs,
      ];
}
