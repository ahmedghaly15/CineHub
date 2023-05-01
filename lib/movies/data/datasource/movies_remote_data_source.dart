import 'package:cine_app/core/errors/exception_handler.dart';
import 'package:cine_app/core/network/error_message_model.dart';
import 'package:cine_app/movies/data/models/movies_model.dart';
import 'package:dio/dio.dart';

class MoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=afca72c3cbf955353383175b47c986a4');

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
