import 'package:cine_app/movies/data/models/movies_model.dart';
import 'package:cine_app/movies/domain/entities/movie_details_parameters.dart';

import '../models/movie_details_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
}
