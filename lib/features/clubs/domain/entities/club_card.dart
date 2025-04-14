import 'package:equatable/equatable.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club_card_data.dart';

class ClubCard extends Equatable {
  final String msg;
  final ClubCardData data;

  const ClubCard({required this.msg, required this.data});

  @override
  List<Object?> get props => [
        msg,
        data,
      ];
}
