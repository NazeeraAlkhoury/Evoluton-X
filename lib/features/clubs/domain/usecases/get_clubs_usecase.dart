import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/clubs/domain/entities/all_clubs.dart';
import 'package:evoluton_x/features/clubs/domain/repository/clubs_repository.dart';

class GetClubsUsecase extends BaseUseCases<AllClubs, NoParameters> {
  final ClubsRepository clubsRepository;

  GetClubsUsecase({required this.clubsRepository});
  @override
  Future<Either<Failure, AllClubs>> call(NoParameters parameters) async {
    return await clubsRepository.getClubs();
  }
}
