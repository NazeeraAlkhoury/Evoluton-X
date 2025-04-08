import 'package:equatable/equatable.dart';

class PlayerItemInput extends Equatable {
  final String title;
  final String value;

  const PlayerItemInput({required this.title, required this.value});

  @override
  List<Object?> get props => [
        title,
        value,
      ];
}
