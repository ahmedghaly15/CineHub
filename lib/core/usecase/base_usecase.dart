import 'package:cine_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
