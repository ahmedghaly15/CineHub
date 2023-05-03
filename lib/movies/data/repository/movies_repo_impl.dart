import 'package:dartz/dartz.dart';

import '/core/errors/exception_handler.dart';
import '/core/errors/failure.dart';
import '/movies/data/datasource/base_movies_remote_data_source.dart';
import '/movies/domain/entities/movie_details.dart';
import '/movies/domain/entities/movie_details_parameters.dart';
import '/movies/domain/entities/movies.dart';
import '/movies/domain/entities/recommendations.dart';
import '/movies/domain/entities/recommendations_parameters.dart';
import '/movies/domain/repository/movies_repo.dart';

class MoviesRepoImpl extends MoviesRepo {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepoImpl(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      RecommendationsParameters parameters) async {
    final result =
        await baseMoviesRemoteDataSource.getRecommendations(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
