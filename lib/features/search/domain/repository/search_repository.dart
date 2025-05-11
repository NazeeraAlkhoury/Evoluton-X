import 'package:dartz/dartz.dart';
import 'package:evoluton_x/core/errors/failure.dart';
import 'package:evoluton_x/features/search/domain/entities/all_players.dart';

abstract class SearchRepository {
  Future<Either<Failure, AllPlayers>> getAllPlayers();
  Future<Either<Failure, AllPlayers>> search({required String name});
}
