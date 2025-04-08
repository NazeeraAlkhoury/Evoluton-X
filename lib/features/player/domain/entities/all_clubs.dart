import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/player/domain/entities/club.dart';

class AllClubs extends Equatable {
  final String msg;
  final List<Club> data;

  const AllClubs({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
