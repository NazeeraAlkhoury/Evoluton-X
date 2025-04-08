import 'package:evoluton_x/features/players/data/models/club_model.dart';
import 'package:evoluton_x/features/players/data/models/players_model.dart';
import 'package:evoluton_x/features/players/domain/entities/club.dart';
import 'package:evoluton_x/features/players/domain/entities/details_data.dart';
import 'package:evoluton_x/features/players/domain/entities/player.dart';

class DetailsDataModel extends DetailsData {
  const DetailsDataModel({
    required super.suggested,
    required super.bestClubs,
  });

  factory DetailsDataModel.fromJson(Map<String, dynamic> json) =>
      DetailsDataModel(
        suggested: List<Player>.from((json['suggested'] as List).map(
          (player) => PlayersModel.fromJson(player),
        )),
        bestClubs: List<Club>.from((json['best_clubs'] as List).map(
          (club) => ClubModel.fromJson(club),
        )),
      );
}
