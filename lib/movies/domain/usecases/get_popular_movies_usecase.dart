import 'package:cine_app/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/movies.dart';
import '../repository/movies_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>> {
  final MoviesRepo moviesRepo;

  GetPopularMoviesUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, List<Movies>>> call() async {
    return await moviesRepo.getPopularMovies();
  }
}
