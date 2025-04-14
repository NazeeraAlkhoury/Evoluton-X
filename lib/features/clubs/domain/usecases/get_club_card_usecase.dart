import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/clubs/domain/entities/club_card.dart';
import 'package:evoluton_x/features/clubs/domain/repository/clubs_repository.dart';

class GetClubCardUsecase extends BaseUseCases<ClubCard, int> {
  final ClubsRepository clubsRepository;

  GetClubCardUsecase({required this.clubsRepository});
  @override
  Future<Either<Failure, ClubCard>> call(int parameters) async {
    return await clubsRepository.getClubCard(clubId: parameters);
  }
}
