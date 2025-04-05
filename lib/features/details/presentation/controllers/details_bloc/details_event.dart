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
  @override
  List<Object?> get props => [];
  const GetDetailsEvent();
}
