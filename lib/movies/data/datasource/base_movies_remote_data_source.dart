import '../../domain/entities/movies.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<Movies>> getNowPlayingMovies();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getTopRatedMovies();
}
