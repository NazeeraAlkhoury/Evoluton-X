import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/core/usecases/base_usecase.dart';
import 'package:evoluton_x/features/details/domain/entities/prediction_result.dart';
import 'package:evoluton_x/features/details/domain/repository/details_repository.dart';

class GetPredictionResultUseCase extends BaseUseCases<PredictionResult, int> {
  final DetailsRepository detailsRepository;

  GetPredictionResultUseCase({required this.detailsRepository});

  @override
  Future<Either<Failure, PredictionResult>> call(int parameters) async {
    return await detailsRepository.getPredictionResult(playerId: parameters);
  }
}
