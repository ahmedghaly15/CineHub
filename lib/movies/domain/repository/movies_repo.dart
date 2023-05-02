import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '/movies/domain/entities/movies.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();
}
