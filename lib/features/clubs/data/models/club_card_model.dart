import 'package:evoluton_x/features/clubs/data/models/club_card_data_model.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club_card.dart';

class ClubCardModel extends ClubCard {
  const ClubCardModel({
    required super.msg,
    required super.data,
  });

  factory ClubCardModel.fromJson(Map<String, dynamic> json) => ClubCardModel(
        msg: json['msg'],
        data: ClubCardCardDataModel.fromJson(json['data']),
      );
}
