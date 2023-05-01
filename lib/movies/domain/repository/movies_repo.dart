import '/movies/domain/entities/movies.dart';

abstract class MoviesRepo {
  Future<List<Movies>> getNowPlayingMovies();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getTopRatedMovies();
}
