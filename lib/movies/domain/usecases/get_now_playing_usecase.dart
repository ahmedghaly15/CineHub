import 'package:cine_app/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '/movies/domain/entities/movies.dart';
import '/movies/domain/repository/movies_repo.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movies>> {
  final MoviesRepo moviesRepo;

  GetNowPlayingMoviesUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, List<Movies>>> call() async {
    return await moviesRepo.getNowPlayingMovies();
  }
}
