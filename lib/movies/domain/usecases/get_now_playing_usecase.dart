import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '/movies/domain/entities/movies.dart';
import '/movies/domain/repository/movies_repo.dart';

class GetNowPlayingMoviesUseCase {
  final MoviesRepo moviesRepo;

  GetNowPlayingMoviesUseCase(this.moviesRepo);

  Future<Either<Failure, List<Movies>>> execute() async {
    return await moviesRepo.getNowPlayingMovies();
  }
}
