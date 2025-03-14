import 'package:equatable/equatable.dart';

abstract class LayoutEvent extends Equatable {
  const LayoutEvent();

  @override
  List<Object?> get props => [];
}

class NavBarItemTappedEvent extends LayoutEvent {
  final int index;

  const NavBarItemTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
