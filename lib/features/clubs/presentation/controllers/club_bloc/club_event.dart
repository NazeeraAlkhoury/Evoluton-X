import 'package:equatable/equatable.dart';

abstract class ClubEvent extends Equatable {
  const ClubEvent();
  @override
  List<Object?> get props => [];
}

class GetClubsEvent extends ClubEvent {
  @override
  List<Object?> get props => [];
}

class GetClubCardEvent extends ClubEvent {
  final int clubId;
  const GetClubCardEvent({required this.clubId});

  @override
  List<Object?> get props => [clubId];
}
