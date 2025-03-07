import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final String? selectedNation;
  final String? savedNation;
  final String? selectedClub;
  final String? savedClub;
  final String? selectedPosition;
  final String? savedPosition;
  final String? selectedAge;
  final String? savedAge;
  const SearchState(
      {this.selectedNation,
      this.savedNation,
      this.selectedClub,
      this.savedClub,
      this.selectedPosition,
      this.savedPosition,
      this.selectedAge,
      this.savedAge});

  SearchState copyWith({
    String? selectedNation,
    String? savedNation,
    String? selectedClub,
    String? savedClub,
    String? selectedPosition,
    String? savedPosition,
    String? selectedAge,
    String? savedAge,
  }) =>
      SearchState(
        selectedNation: selectedNation ?? this.selectedNation,
        savedNation: savedNation ?? this.savedNation,
        selectedClub: selectedClub ?? this.selectedClub,
        savedClub: savedClub ?? this.savedClub,
        selectedPosition: selectedPosition ?? this.selectedPosition,
        savedPosition: savedPosition ?? this.savedPosition,
        selectedAge: selectedAge ?? this.selectedAge,
        savedAge: savedAge ?? this.savedAge,
      );

  @override
  List<Object?> get props => [
        selectedNation,
        savedNation,
        selectedClub,
        savedClub,
        selectedPosition,
        savedPosition,
        savedClub,
        selectedAge,
        savedAge
      ];
}
