import 'package:evoluton_x/features/clubs/data/models/club_model.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club.dart';

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
