import 'package:evoluton_x/features/players/data/models/club_model.dart';
import 'package:evoluton_x/features/players/domain/entities/all_clubs.dart';
import 'package:evoluton_x/features/players/domain/entities/club.dart';

class AllClubsModel extends AllClubs {
  const AllClubsModel({required super.msg, required super.data});

  factory AllClubsModel.fromJson(Map<String, dynamic> json) => AllClubsModel(
        msg: json['msg'],
        data: json['data'] != null
            ? List<Club>.from((json['data'] as List).map(
                (club) => ClubModel.fromJson(club),
              ))
            : [],
      );
}
