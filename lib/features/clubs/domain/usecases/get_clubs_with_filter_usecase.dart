import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/clubs/data/models/clubs_filter_params.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';
import 'package:evoluton_x/features/clubs/domain/repository/clubs_repository.dart';

class GetClubsWithFilterUsecase extends BaseUseCases<AllClubs, ClubsFilterParams> {
  final ClubsRepository clubsRepository;

  GetClubsWithFilterUsecase({required this.clubsRepository});
  @override
  Future<Either<Failure, AllClubs>> call(ClubsFilterParams parameters) async {
    return await clubsRepository.getClubsWithFilter(params: parameters);
  }
}
