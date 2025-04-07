import 'package:equatable/equatable.dart';

class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object?> get props => [];
}

class CarouselItemSelectedEvent extends DetailsEvent {
  final int newIndex;

  const CarouselItemSelectedEvent({required this.newIndex});
  @override
  List<Object?> get props => [newIndex];
}

class GetDetailsEvent extends DetailsEvent {
  const GetDetailsEvent();
  @override
  List<Object?> get props => [];
}

class GetPlayerDetailsEvent extends DetailsEvent {
  final int playerId;

  const GetPlayerDetailsEvent({required this.playerId});
  @override
  List<Object?> get props => [playerId];
}

class GetPlayerStatisticsEvent extends DetailsEvent {
  final int playerId;

  const GetPlayerStatisticsEvent({required this.playerId});
  @override
  List<Object?> get props => [playerId];
}

class GetPredictionResultEvent extends DetailsEvent {
  final int playerId;

  const GetPredictionResultEvent({required this.playerId});
  @override
  List<Object?> get props => [playerId];
}

class ResetPlayerEvent extends DetailsEvent {
  const ResetPlayerEvent();
  @override
  List<Object?> get props => [];
}
