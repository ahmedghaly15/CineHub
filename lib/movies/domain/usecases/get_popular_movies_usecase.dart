import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/movies.dart';
import '../repository/movies_repo.dart';

class GetPopularMoviesUseCase {
  final MoviesRepo moviesRepo;

  GetPopularMoviesUseCase(this.moviesRepo);

  Future<Either<Failure, List<Movies>>> execute() async {
    return await moviesRepo.getPopularMovies();
  }
}
