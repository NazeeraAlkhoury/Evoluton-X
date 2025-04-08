import 'package:evoluton_x/features/player/data/models/details_data_model.dart';
import 'package:evoluton_x/features/player/domain/entities/details.dart';

class DetailsModel extends Details {
  const DetailsModel({
    required super.msg,
    required super.data,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        msg: json['msg'],
        data: DetailsDataModel.fromJson(json['data']),
      );
}
