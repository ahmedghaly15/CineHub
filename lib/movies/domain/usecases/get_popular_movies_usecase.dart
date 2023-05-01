import '../entities/movies.dart';
import '../repository/movies_repo.dart';

class GetPopularMoviesUseCase {
  final MoviesRepo moviesRepo;

  GetPopularMoviesUseCase(this.moviesRepo);

  Future<List<Movies>> execute() async {
    return await moviesRepo.getNowPlayingMovies();
  }
}
