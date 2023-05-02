import 'package:cine_app/core/errors/exception_handler.dart';
import 'package:cine_app/core/errors/failure.dart';
import 'package:cine_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:cine_app/movies/domain/entities/movies.dart';
import 'package:cine_app/movies/domain/repository/movies_repo.dart';
import 'package:dartz/dartz.dart';

class MoviesRepoImpl extends MoviesRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepoImpl(this.moviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await moviesRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await moviesRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await moviesRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
