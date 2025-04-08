import 'package:equatable/equatable.dart';

class Club extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String? nation;

  const Club({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.nation,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        nation,
      ];
}
