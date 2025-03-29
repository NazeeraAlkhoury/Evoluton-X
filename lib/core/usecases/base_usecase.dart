import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/errors/failure.dart';

abstract class BaseUseCases<Type, Parameters> {
  Future<Either<Failure, Type>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
