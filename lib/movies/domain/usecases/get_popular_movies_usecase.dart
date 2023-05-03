import 'package:dartz/dartz.dart';

import '../entities/movies.dart';
import '../repository/movies_repo.dart';
import '/core/errors/failure.dart';
import '/core/usecase/base_usecase.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>, NoParameters> {
  final MoviesRepo moviesRepo;

  GetPopularMoviesUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await moviesRepo.getPopularMovies();
  }
}
