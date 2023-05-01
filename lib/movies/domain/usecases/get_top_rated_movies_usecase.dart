import '../entities/movies.dart';
import '../repository/movies_repo.dart';

class GetTopRatedMoviesUseCase {
  final MoviesRepo moviesRepo;

  GetTopRatedMoviesUseCase(this.moviesRepo);

  Future<List<Movies>> execute() async {
    return await moviesRepo.getTopRatedMovies();
  }
}
