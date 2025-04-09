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
