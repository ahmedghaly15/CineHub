import 'package:cine_app/core/errors/exception_handler.dart';
import 'package:cine_app/core/network/api_constants.dart';
import 'package:cine_app/core/network/error_message_model.dart';
import 'package:cine_app/movies/data/models/movies_model.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/movies.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<Movies>> getNowPlayingMovies();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getTopRatedMovies();
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    var response = await Dio().get(ApiConstants.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (movie) => MoviesModel.fromJson(movie),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Movies>> getPopularMovies() async {
    var response = await Dio().get(ApiConstants.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (movie) => MoviesModel.fromJson(movie),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Movies>> getTopRatedMovies() async {
    var response = await Dio().get(ApiConstants.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (movie) => MoviesModel.fromJson(movie),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
