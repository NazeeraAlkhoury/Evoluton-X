import 'package:equatable/equatable.dart';

class ClubsFilterParams extends Equatable {
  final String name;
  final String comp;

  const ClubsFilterParams({required this.name, required this.comp});

  Map<String, String> toJson() {
    return {
      'name': name,
      'comp': comp,
    };
  }

  @override
  List<Object?> get props => [name, comp];
}
