import 'package:equatable/equatable.dart';

class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class CarouselItemSelectedEvent extends DetailsEvent {
  final int newIndex;

  const CarouselItemSelectedEvent({required this.newIndex});
}
