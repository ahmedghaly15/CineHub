import 'package:cine_app/core/errors/exception_handler.dart';
import 'package:cine_app/core/network/api_constants.dart';
import 'package:cine_app/core/network/error_message_model.dart';
import 'package:cine_app/movies/data/models/movie_details_model.dart';
import 'package:cine_app/movies/data/models/movies_model.dart';
import 'package:cine_app/movies/data/models/recommendations_model.dart';
import 'package:cine_app/movies/domain/entities/movie_details_parameters.dart';
import 'package:cine_app/movies/domain/entities/recommendations_parameters.dart';
import 'package:dio/dio.dart';

import 'base_movies_remote_data_source.dart';

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
  Future<List<MoviesModel>> getPopularMovies() async {
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
  Future<List<MoviesModel>> getTopRatedMovies() async {
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

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    var response = await Dio().get(
      ApiConstants.movieDetailsPath(parameters.movieId),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
    RecommendationsParameters parameters,
  ) async {
    var response = await Dio().get(
      ApiConstants.recommendationsPath(parameters.id),
    );

    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(
        (response.data['results'] as List).map(
          (movie) => RecommendationsModel.fromJson(movie),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
