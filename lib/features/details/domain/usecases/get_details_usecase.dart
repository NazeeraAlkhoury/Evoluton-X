import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/details/domain/entities/details.dart';
import 'package:evoluton_x/features/details/domain/repository/details_repository.dart';

class GetDetailsUsecase extends BaseUseCases<Details, NoParameters> {
  final DetailsRepository detailsRepository;

  GetDetailsUsecase({required this.detailsRepository});
  @override
  Future<Either<Failure, Details>> call(NoParameters parameters) async {
    return await detailsRepository.getDetails();
  }
}
