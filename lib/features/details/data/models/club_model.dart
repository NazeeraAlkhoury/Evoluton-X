import 'package:evoluton_x/features/details/domain/entities/club.dart';

class ClubModel extends Club {
  const ClubModel(
      {required super.id,
      required super.name,
      required super.imageUrl,
      required super.nation});

  factory ClubModel.fromJson(Map<String, dynamic> json) => ClubModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
        nation: json['nation'],
      );
}
