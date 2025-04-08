import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/players/domain/entities/details_data.dart';

class Details extends Equatable {
  final String msg;
  final DetailsData data;

  const Details({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
