import 'package:equatable/equatable.dart';

class ClubsFilterParams extends Equatable {
  final String? name;
  final String? comp;

  const ClubsFilterParams({this.name, this.comp});

  Map<String, String> toJson() {
    final Map<String, String> data = {};
    if (name != null && name!.isNotEmpty) {
      data['name'] = name!;
    }
    if (comp != null && comp!.isNotEmpty) {
      data['comp'] = comp!;
    }
    return data;
  }

  @override
  List<Object?> get props => [name, comp];
}
