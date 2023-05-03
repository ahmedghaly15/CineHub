import 'package:dartz/dartz.dart';

import '../entities/movies.dart';
import '../repository/movies_repo.dart';
import '/core/errors/failure.dart';
import '/core/usecase/base_usecase.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movies>, NoParameters> {
  final MoviesRepo moviesRepo;

  GetTopRatedMoviesUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await moviesRepo.getTopRatedMovies();
  }
}
