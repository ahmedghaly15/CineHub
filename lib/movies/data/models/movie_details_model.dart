import 'package:cine_app/movies/data/models/genres_model.dart';
import 'package:cine_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genres,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      genres: List<GenresModel>.from(
        json['genres'].map((x) => GenresModel.fromJson(x)),
      ),
      runtime: json['runtime'],
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
