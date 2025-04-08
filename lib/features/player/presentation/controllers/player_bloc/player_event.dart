import 'package:equatable/equatable.dart';

class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

class CarouselItemSelectedEvent extends PlayerEvent {
  final int newIndex;

  const CarouselItemSelectedEvent({required this.newIndex});
  @override
  List<Object?> get props => [newIndex];
}

class GetDetailsEvent extends PlayerEvent {
  const GetDetailsEvent();
  @override
  List<Object?> get props => [];
}

class GetPlayerDetailsEvent extends PlayerEvent {
  final int playerId;

  const GetPlayerDetailsEvent({required this.playerId});
  @override
  List<Object?> get props => [playerId];
}

class GetPlayerStatisticsEvent extends PlayerEvent {
  final int playerId;

  const GetPlayerStatisticsEvent({required this.playerId});
  @override
  List<Object?> get props => [playerId];
}

class GetPredictionResultEvent extends PlayerEvent {
  final int playerId;

  const GetPredictionResultEvent({required this.playerId});
  @override
  List<Object?> get props => [playerId];
}

class ResetPlayerEvent extends PlayerEvent {
  const ResetPlayerEvent();
  @override
  List<Object?> get props => [];
}
