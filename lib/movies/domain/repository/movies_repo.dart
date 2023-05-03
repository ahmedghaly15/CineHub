import 'package:dartz/dartz.dart';

import '../entities/movie_details.dart';
import '/core/errors/failure.dart';
import '/movies/domain/entities/movie_details_parameters.dart';
import '/movies/domain/entities/movies.dart';
import '/movies/domain/entities/recommendations.dart';
import '/movies/domain/entities/recommendations_parameters.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
    MovieDetailsParameters parameters,
  );

  Future<Either<Failure, List<Recommendations>>> getRecommendations(
    RecommendationsParameters parameters,
  );
}
