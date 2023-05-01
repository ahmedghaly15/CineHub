import '/movies/domain/entities/movies.dart';
import '/movies/domain/repository/movies_repo.dart';

class GetNowPlayingMoviesUseCase {
  final MoviesRepo moviesRepo;

  GetNowPlayingMoviesUseCase(this.moviesRepo);

  Future<List<Movies>> execute() async {
    return await moviesRepo.getNowPlayingMovies();
  }
}
